﻿using System;
using System.Collections.Generic;
using System.Linq;
using PalladiumDwh.DWapi.Client.Model.DTO;

namespace PalladiumDwh.DWapi.Client.Model.Profiles
{
    public class PatientARTProfile
    {
        public FacilityDTO Facility { get; set; }
        public PatientExtractDTO Demographic { get; set; }
        public List<PatientArtExtractDTO> ArtExtracts { get; set; } = new List<PatientArtExtractDTO>();

        public Facility FacilityInfo { get;  set; }
        public PatientExtract PatientInfo { get;  set; }
        public List<PatientArtExtract> PatientArtExtracts { get;  set; }


        public static PatientARTProfile Create(Facility facility, PatientExtract patient)
        {
            var patientProfile = new PatientARTProfile
            {
                Facility = new FacilityDTO(facility),
                Demographic = new PatientExtractDTO(patient),
                ArtExtracts =
                    new PatientArtExtractDTO().GeneratePatientArtExtractDtOs(patient.PatientArtExtracts).ToList()
            };
            return patientProfile;
        }

        public bool IsValid()
        {
            if (HasData())
                return
                    Facility.IsValid() &&
                    Demographic.IsValid() &&
                    ArtExtracts.Count > 0;
            return false;
        }

        public bool HasData()
        {
          return  null != Facility && null != Demographic && null != ArtExtracts;
        }
      
        public void GeneratePatientRecord()
        {
            FacilityInfo = Facility.GenerateFacility();
            PatientInfo = Demographic.GeneratePatient(FacilityInfo.Id);
        }

        public void GenerateRecords(Guid patientId)
        {
            PatientInfo.Id = patientId;
            PatientArtExtracts = new List<PatientArtExtract>();
            foreach (var e in ArtExtracts)
                PatientArtExtracts.Add(e.GeneratePatientArtExtract(PatientInfo.Id));
        }
        
        public override string ToString()
        {
            return $"{FacilityInfo.Name} | {PatientInfo.PatientCccNumber}";
        }
    }
}