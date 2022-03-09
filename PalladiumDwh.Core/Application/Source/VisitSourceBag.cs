using System;
using System.Collections.Generic;
using PalladiumDwh.Shared.Enum;

namespace PalladiumDwh.Core.Model.Bag
{
    public class VisitSourceBag : ISourceBag<VisitSourceDto>
    {
        public  EmrSetup EmrSetup { get; set; }
        public  UploadMode Mode  { get; set; }
        public string DwapiVersion { get; set; }
        public int SiteCode { get; set; }
        public string Facility { get; set; }
        public Guid? ManifestId { get; set; }
        public Guid? SessionId { get; set; }
        public Guid? FacilityId { get; set; }
        public string Tag { get; set; }
        public List<VisitSourceDto> Extracts { get; set; } = new List<VisitSourceDto>();
    }
}