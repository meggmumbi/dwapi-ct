using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using PalladiumDwh.ClientReader.Core.Interfaces.Source;

namespace PalladiumDwh.ClientReader.Core.Model.Source
{
    [Table("vTempPatientExtractErrorSummary")]
    public class TempPatientExtractErrorSummary: TempExtractErrorSummary
    {
        

    }
}
