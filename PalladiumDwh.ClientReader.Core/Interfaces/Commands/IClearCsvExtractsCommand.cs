﻿using System;
using System.Threading.Tasks;
using PalladiumDwh.Shared.Model;

namespace PalladiumDwh.ClientReader.Core.Interfaces.Commands
{
    public interface IClearCsvExtractsCommand
    {
        Task<int> ExecuteAsync(IProgress<DProgress> dprogress = null);
    }
}