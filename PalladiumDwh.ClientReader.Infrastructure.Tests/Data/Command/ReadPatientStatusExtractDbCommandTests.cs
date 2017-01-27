﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using NUnit.Framework;
using PalladiumDwh.ClientReader.Core.Interfaces.Commands;
using PalladiumDwh.ClientReader.Infrastructure.Data.Command;

namespace PalladiumDwh.ClientReader.Infrastructure.Tests.Data.Command
{
    public class ReadPatientStatusExtractDbCommandTests
    {
        private IDbConnection _connection;
        private string _commandText;
        private ILoadPatientStatusExtractCommand _extractCommand;

        [SetUp]
        public void SetUp()
        {
            _commandText = @"
Select tmp_PatientMaster.PatientID,
tmp_LastStatus.PatientPK,
 tmp_PatientMaster.[SiteCode],
  tmp_PatientMaster.FacilityName,
  tmp_LastStatus.ExitDescription,
  tmp_LastStatus.ExitDate,
  tmp_LastStatus.ExitReason
 ,CAST(getdate() AS DATE) AS DateExtracted
  
From tmp_LastStatus
 INNER JOIN  tmp_PatientMaster On tmp_LastStatus.PatientPK =  tmp_PatientMaster.PatientPK

  
";
        }

        [Test]
        public void should_Execute_For_MSSQL()
        {
           
        }
        /*
        [Test]
        public void should_Execute_For_MySQL()
        {
            var connection = ConfigurationManager.ConnectionStrings["MySQLEMRDatabase"].ConnectionString;
            _connection = new MySqlConnection(connection);
            _extractCommand = new LoadPatientExtractDbCommand(_connection, $"{_commandText} tmp_PatientMaster");

            var list = _extractCommand.Execute().ToList();
            Assert.IsTrue(list.Count > 0);

            Console.WriteLine($"Loaded {list.Count} records!");
            
        }
        [Test]
        public void should_Execute_For_Postgress()
        {
            var connection = ConfigurationManager.ConnectionStrings["PostgreSQLEMRDatabase"].ConnectionString;
            _connection = new NpgsqlConnection(connection);
            _extractCommand = new LoadPatientExtractDbCommand(_connection, $"{_commandText} tmp_patientmaster".ToLower());

            var list = _extractCommand.Execute().ToList();
            Assert.IsTrue(list.Count > 0);

            Console.WriteLine($"Loaded {list.Count} records!");
        }
        */
    }
}
