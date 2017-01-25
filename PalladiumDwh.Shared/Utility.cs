﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;
using log4net;

namespace PalladiumDwh.Shared
{
    public static class Utility
    {
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        public static IEnumerable<IEnumerable<T>> Split<T>(this IEnumerable<T> fullBatch, int chunkSize)
        {
            if (chunkSize <= 0)
            {
                throw new ArgumentOutOfRangeException(
                    "chunkSize",
                    chunkSize,
                    "Chunk size cannot be less than or equal to zero.");
            }

            if (fullBatch == null)
            {
                throw new ArgumentNullException("fullBatch", "Input to be split cannot be null.");
            }

            var cellCounter = 0;
            var chunk = new List<T>(chunkSize);

            foreach (var element in fullBatch)
            {
                if (cellCounter++ == chunkSize)
                {
                    yield return chunk;
                    chunk = new List<T>(chunkSize);
                    cellCounter = 1;
                }

                chunk.Add(element);
            }

            yield return chunk;
        }

        public static string GetMessageType(Type type)
        {
            return $"{type.FullName}, {type.Assembly.GetName().Name}";
        }

        public static object Get(this IDataRecord row, string fieldName, Type type)
        {
            int ordinal = -1;
            try
            {
                ordinal = row.GetOrdinal(fieldName);
            }
            catch (IndexOutOfRangeException ex)
            {
                Log.Debug(ex);
            }
            if (ordinal > -1)
            {
                var value = row.IsDBNull(ordinal) ? GetDefault(type) : row.GetValue(ordinal);
                return Convert.ChangeType(value, type);
            }
            return GetDefault(type);
        }

        public static object GetDefault(Type type)
        {
            if (type.IsValueType)
            {
                if (type==typeof(DateTime))
                    return new DateTime(1900, 1, 1);

                return Activator.CreateInstance(type);

            }
            return null;
        }

        public static T Get<T>(this IDataRecord row, string fieldName) 
        {
            int ordinal = row.GetOrdinal(fieldName);
            return row.Get<T>(ordinal);
        }

        public static T Get<T>(this IDataRecord row, int ordinal)
        {
            var value = row.IsDBNull(ordinal) ? default(T) : row.GetValue(ordinal);
            return (T)Convert.ChangeType(value, typeof(T));
        }
        public static DataTable ToDataTable<T>(this List<T> items)
        {
            var tb = new DataTable(typeof(T).Name);

            PropertyInfo[] props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);

            foreach (var prop in props)
            {
                if (prop.PropertyType.Name.Contains("Nullable"))
                    tb.Columns.Add(prop.Name,typeof(string));
                else
                    tb.Columns.Add(prop.Name, prop.PropertyType);
            }

            foreach (var item in items)
            {
                var values = new object[props.Length];
                for (var i = 0; i < props.Length; i++)
                {
                    values[i] = props[i].GetValue(item, null);
                }

                tb.Rows.Add(values);
            }

            return tb;
        }
    }
}

