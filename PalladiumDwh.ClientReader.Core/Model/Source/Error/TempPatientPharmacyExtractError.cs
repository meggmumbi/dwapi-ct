using System;
using PalladiumDwh.ClientReader.Core.Interfaces.Source.Error;

namespace PalladiumDwh.ClientReader.Core.Model.Source.Error
{
    
    public class TempPatientPharmacyExtractError : TempExtractError, ITempPatientPharmacyExtractError
    {
     


        public override string ToString()
        {
            return $"{SiteCode}-{PatientID}";
        }

        public int? VisitID { get; set; }
        public string Drug { get; set; }
        public string Provider { get; set; }
        public DateTime? DispenseDate { get; set; }
        public decimal? Duration { get; set; }
        public DateTime? ExpectedReturn { get; set; }
        public string TreatmentType { get; set; }
        public string RegimenLine { get; set; }
        public string PeriodTaken { get; set; }
        public string ProphylaxisType { get; set; }
        public string Emr { get; set; }
        public string Project { get; set; }
    }
}
