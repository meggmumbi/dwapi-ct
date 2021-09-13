using System;

namespace PalladiumDwh.Shared.Interfaces
{
    public interface IDefaulterTracing{
        DateTime? FacilityName{get;set;}
        int? VisitID{get;set;}
        DateTime? VisitDate{get;set;}
        int? EncounterId{get;set;}
        string TracingType{get;set;}
        string TracingOutcome{get;set;}
        int? AttemptNumber{get;set;}
        string IsFinalTrace{get;set;}
        string TrueStatus{get;set;}
        string CauseOfDeath{get;set;}
        string Comments{get;set;}
        DateTime? BookingDate{get;set;}
    }
}