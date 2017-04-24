using System;
using PalladiumDwh.ClientReader.Core.Interfaces.Source.Error;

namespace PalladiumDwh.ClientReader.Core.Model.Source.Error
{
    
    public class TempPatientLaboratoryExtractError : TempExtractError, ITempPatientLaboratoryExtractError
    {

        public override string ToString()
        {
            return $"{SiteCode}-{PatientID}";
        }

        public string FacilityName { get; set; }
        public string SatelliteName { get; set; }
        public string Emr { get; set; }
        public string Project { get; set; }
        public int? VisitId { get; set; }
        public DateTime? OrderedByDate { get; set; }
        public DateTime? ReportedByDate { get; set; }
        public string TestName { get; set; }
        public int? EnrollmentTest { get; set; }
        public string TestResult { get; set; }
    }
}
