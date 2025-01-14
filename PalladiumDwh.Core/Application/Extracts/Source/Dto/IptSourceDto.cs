using System;
using PalladiumDwh.Shared.Interfaces;

namespace PalladiumDwh.Core.Application.Extracts.Source.Dto
{
    public class IptSourceDto:SourceDto, IIpt
    {
        public string FacilityName { get; set; }
        public int? VisitID { get; set; }
        public DateTime? VisitDate { get; set; }
        public string OnTBDrugs { get; set; }
        public string OnIPT { get; set; }
        public string EverOnIPT { get; set; }
        public string Cough { get; set; }
        public string Fever { get; set; }
        public string NoticeableWeightLoss { get; set; }
        public string NightSweats { get; set; }
        public string Lethargy { get; set; }
        public string ICFActionTaken { get; set; }
        public string TestResult { get; set; }
        public string TBClinicalDiagnosis { get; set; }
        public string ContactsInvited { get; set; }
        public string EvaluatedForIPT { get; set; }
        public string StartAntiTBs { get; set; }
        public DateTime? TBRxStartDate { get; set; }
        public string TBScreening { get; set; }
        public string IPTClientWorkUp { get; set; }
        public string StartIPT { get; set; }
        public string IndicationForIPT { get; set; }
        public DateTime? Date_Created { get; set; }
        public DateTime? Date_Last_Modified { get; set; }
        public string RecordUUID { get; set; }
        public DateTime? TPTInitiationDate { get; set; }
        public string IPTDiscontinuation { get; set; }
        public DateTime? DateOfDiscontinuation { get; set; }

    }
}