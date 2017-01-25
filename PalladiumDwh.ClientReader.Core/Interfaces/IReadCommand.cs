﻿using System.Collections.Generic;
using PalladiumDwh.ClientReader.Core.Model;

namespace PalladiumDwh.ClientReader.Core.Interfaces
{
    public interface IReadCommand<T> where T: ExtractRow
    {
        IEnumerable<T> Execute();
    }
}