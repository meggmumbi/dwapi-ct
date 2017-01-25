using System;
using System.Collections.Generic;
using PalladiumDwh.Shared.Model;

namespace PalladiumDwh.ClientReader.Core.Interfaces
{
    public interface IPatientPharmacyExtractRow:IExtractRow
    {
        int PatientPK { get; set; }
        string PatientID { get; set; }
        int FacilityId { get; set; }
        int SiteCode { get; set; }
        int VisitID { get; set; }
        string Drug { get; set; }
        string Provider { get; set; }
        DateTime DispenseDate { get; set; }
        decimal Duration { get; set; }
        DateTime ExpectedReturn { get; set; }
        string TreatmentType { get; set; }
        string RegimenLine { get; set; }
        string PeriodTaken { get; set; }
        string ProphylaxisType { get; set; }
    }
}