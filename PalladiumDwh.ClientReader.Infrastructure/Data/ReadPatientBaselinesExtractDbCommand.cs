﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PalladiumDwh.ClientReader.Core.Interfaces;
using PalladiumDwh.ClientReader.Core.Model;
using PalladiumDwh.Shared.Interfaces;
using PalladiumDwh.Shared.Model.DTO;

namespace PalladiumDwh.ClientReader.Infrastructure.Data
{
  public  class ReadPatientBaselinesExtractDbCommand : ExtractDbCommand<PatientBaselinesExtractRow>, IReadPatientBaselinesExtractCommand
  {
      public ReadPatientBaselinesExtractDbCommand(IDbConnection connection, string commandText) : base(connection, commandText)
      {
      }
  }
}
