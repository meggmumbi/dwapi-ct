﻿CREATE TABLE [dbo].[Facility] (
    [Code] [int] NOT NULL IDENTITY,
    [Name] [nvarchar](150),
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    CONSTRAINT [PK_dbo.Facility] PRIMARY KEY ([Code])
)
CREATE TABLE [dbo].[PatientArtExtract] (
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [Processed] [bit],
    [Id] [uniqueidentifier] NOT NULL,
    [DOB] [datetime],
    [AgeEnrollment] [decimal](18, 2),
    [AgeARTStart] [decimal](18, 2),
    [AgeLastVisit] [decimal](18, 2),
    [RegistrationDate] [datetime],
    [Gender] [nvarchar](150),
    [PatientSource] [nvarchar](150),
    [StartARTDate] [datetime],
    [PreviousARTStartDate] [datetime],
    [PreviousARTRegimen] [nvarchar](150),
    [StartARTAtThisFacility] [datetime],
    [StartRegimen] [nvarchar](150),
    [StartRegimenLine] [nvarchar](150),
    [LastARTDate] [datetime],
    [LastRegimen] [nvarchar](150),
    [LastRegimenLine] [nvarchar](150),
    [Duration] [decimal](18, 2),
    [ExpectedReturn] [datetime],
    [Provider] [nvarchar](150),
    [LastVisit] [datetime],
    [ExitReason] [nvarchar](150),
    [ExitDate] [datetime],
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [SiteCode] [int] NOT NULL,
    [QueueId] [nvarchar](150),
    [Status] [nvarchar](150),
    [StatusDate] [datetime],
    CONSTRAINT [PK_dbo.PatientArtExtract] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_PatientPK_SiteCode] ON [dbo].[PatientArtExtract]([PatientPK], [SiteCode])
CREATE TABLE [dbo].[PatientBaselinesExtract] (
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [Processed] [bit],
    [Id] [uniqueidentifier] NOT NULL,
    [bCD4] [int],
    [bCD4Date] [datetime],
    [bWAB] [int],
    [bWABDate] [datetime],
    [bWHO] [int],
    [bWHODate] [datetime],
    [eWAB] [int],
    [eWABDate] [datetime],
    [eCD4] [int],
    [eCD4Date] [datetime],
    [eWHO] [int],
    [eWHODate] [datetime],
    [lastWHO] [int],
    [lastWHODate] [datetime],
    [lastCD4] [int],
    [lastCD4Date] [datetime],
    [lastWAB] [int],
    [lastWABDate] [datetime],
    [m12CD4] [int],
    [m12CD4Date] [datetime],
    [m6CD4] [int],
    [m6CD4Date] [datetime],
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [SiteCode] [int] NOT NULL,
    [QueueId] [nvarchar](150),
    [Status] [nvarchar](150),
    [StatusDate] [datetime],
    CONSTRAINT [PK_dbo.PatientBaselinesExtract] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_PatientPK_SiteCode] ON [dbo].[PatientBaselinesExtract]([PatientPK], [SiteCode])
CREATE TABLE [dbo].[PatientExtract] (
    [PatientPK] [int] NOT NULL,
    [SiteCode] [int] NOT NULL,
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [Processed] [bit],
    [FacilityName] [nvarchar](150),
    [Gender] [nvarchar](150),
    [DOB] [datetime],
    [RegistrationDate] [datetime],
    [RegistrationAtCCC] [datetime],
    [RegistrationATPMTCT] [datetime],
    [RegistrationAtTBClinic] [datetime],
    [PatientSource] [nvarchar](150),
    [Region] [nvarchar](150),
    [District] [nvarchar](150),
    [Village] [nvarchar](150),
    [ContactRelation] [nvarchar](150),
    [LastVisit] [datetime],
    [MaritalStatus] [nvarchar](150),
    [EducationLevel] [nvarchar](150),
    [DateConfirmedHIVPositive] [datetime],
    [PreviousARTExposure] [nvarchar](150),
    [PreviousARTStartDate] [datetime],
    [StatusAtCCC] [nvarchar](150),
    [StatusAtPMTCT] [nvarchar](150),
    [StatusAtTBClinic] [nvarchar](150),
    [Id] [uniqueidentifier] NOT NULL,
    [PatientID] [nvarchar](150),
    [QueueId] [nvarchar](150),
    [Status] [nvarchar](150),
    [StatusDate] [datetime],
    CONSTRAINT [PK_dbo.PatientExtract] PRIMARY KEY ([PatientPK], [SiteCode])
)
CREATE TABLE [dbo].[PatientLaboratoryExtract] (
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [Processed] [bit],
    [Id] [uniqueidentifier] NOT NULL,
    [VisitId] [int],
    [OrderedByDate] [datetime],
    [ReportedByDate] [datetime],
    [TestName] [nvarchar](150),
    [EnrollmentTest] [int],
    [TestResult] [nvarchar](150),
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [SiteCode] [int] NOT NULL,
    [QueueId] [nvarchar](150),
    [Status] [nvarchar](150),
    [StatusDate] [datetime],
    CONSTRAINT [PK_dbo.PatientLaboratoryExtract] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_PatientPK_SiteCode] ON [dbo].[PatientLaboratoryExtract]([PatientPK], [SiteCode])
CREATE TABLE [dbo].[PatientPharmacyExtract] (
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [Processed] [bit],
    [Id] [uniqueidentifier] NOT NULL,
    [VisitID] [int],
    [Drug] [nvarchar](150),
    [Provider] [nvarchar](150),
    [DispenseDate] [datetime],
    [Duration] [decimal](18, 2),
    [ExpectedReturn] [datetime],
    [TreatmentType] [nvarchar](150),
    [RegimenLine] [nvarchar](150),
    [PeriodTaken] [nvarchar](150),
    [ProphylaxisType] [nvarchar](150),
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [SiteCode] [int] NOT NULL,
    [QueueId] [nvarchar](150),
    [Status] [nvarchar](150),
    [StatusDate] [datetime],
    CONSTRAINT [PK_dbo.PatientPharmacyExtract] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_PatientPK_SiteCode] ON [dbo].[PatientPharmacyExtract]([PatientPK], [SiteCode])
CREATE TABLE [dbo].[PatientStatusExtract] (
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [Processed] [bit],
    [Id] [uniqueidentifier] NOT NULL,
    [ExitDescription] [nvarchar](150),
    [ExitDate] [datetime],
    [ExitReason] [nvarchar](150),
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [SiteCode] [int] NOT NULL,
    [QueueId] [nvarchar](150),
    [Status] [nvarchar](150),
    [StatusDate] [datetime],
    CONSTRAINT [PK_dbo.PatientStatusExtract] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_PatientPK_SiteCode] ON [dbo].[PatientStatusExtract]([PatientPK], [SiteCode])
CREATE TABLE [dbo].[PatientVisitExtract] (
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [Processed] [bit],
    [Id] [uniqueidentifier] NOT NULL,
    [VisitId] [int],
    [VisitDate] [datetime],
    [Service] [nvarchar](150),
    [VisitType] [nvarchar](150),
    [WHOStage] [int],
    [WABStage] [nvarchar](150),
    [Pregnant] [nvarchar](150),
    [LMP] [datetime],
    [EDD] [datetime],
    [Height] [decimal](18, 2),
    [Weight] [decimal](18, 2),
    [BP] [nvarchar](150),
    [OI] [nvarchar](150),
    [OIDate] [datetime],
    [SubstitutionFirstlineRegimenDate] [datetime],
    [SubstitutionFirstlineRegimenReason] [nvarchar](150),
    [SubstitutionSecondlineRegimenDate] [datetime],
    [SubstitutionSecondlineRegimenReason] [nvarchar](150),
    [SecondlineRegimenChangeDate] [datetime],
    [SecondlineRegimenChangeReason] [nvarchar](150),
    [Adherence] [nvarchar](150),
    [AdherenceCategory] [nvarchar](150),
    [FamilyPlanningMethod] [nvarchar](150),
    [PwP] [nvarchar](150),
    [GestationAge] [decimal](18, 2),
    [NextAppointmentDate] [datetime],
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [SiteCode] [int] NOT NULL,
    [QueueId] [nvarchar](150),
    [Status] [nvarchar](150),
    [StatusDate] [datetime],
    CONSTRAINT [PK_dbo.PatientVisitExtract] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_PatientPK_SiteCode] ON [dbo].[PatientVisitExtract]([PatientPK], [SiteCode])
CREATE TABLE [dbo].[EMR] (
    [Id] [uniqueidentifier] NOT NULL,
    [Name] [nvarchar](150),
    [Version] [nvarchar](150),
    [ConnectionKey] [nvarchar](150),
    [IsDefault] [bit] NOT NULL,
    [ProjectId] [uniqueidentifier] NOT NULL,
    CONSTRAINT [PK_dbo.EMR] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_ProjectId] ON [dbo].[EMR]([ProjectId])
CREATE TABLE [dbo].[ExtractSetting] (
    [Id] [uniqueidentifier] NOT NULL,
    [Name] [nvarchar](150),
    [Display] [nvarchar](150),
    [ExtractCsv] [nvarchar](150),
    [ExtractSql] [nvarchar](max),
    [Destination] [nvarchar](150),
    [Rank] [decimal](18, 2) NOT NULL,
    [IsActive] [bit] NOT NULL,
    [IsPriority] [bit] NOT NULL,
    [EmrId] [uniqueidentifier] NOT NULL,
    CONSTRAINT [PK_dbo.ExtractSetting] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_EmrId] ON [dbo].[ExtractSetting]([EmrId])
CREATE TABLE [dbo].[Project] (
    [Id] [uniqueidentifier] NOT NULL,
    [Code] [nvarchar](150),
    [Name] [nvarchar](150),
    CONSTRAINT [PK_dbo.Project] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[TempPatientArtExtract] (
    [Id] [uniqueidentifier] NOT NULL,
    [FacilityName] [nvarchar](150),
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [DOB] [datetime],
    [AgeEnrollment] [decimal](18, 2),
    [AgeARTStart] [decimal](18, 2),
    [AgeLastVisit] [decimal](18, 2),
    [RegistrationDate] [datetime],
    [PatientSource] [nvarchar](150),
    [Gender] [nvarchar](150),
    [StartARTDate] [datetime],
    [PreviousARTStartDate] [datetime],
    [PreviousARTRegimen] [nvarchar](150),
    [StartARTAtThisFacility] [datetime],
    [StartRegimen] [nvarchar](150),
    [StartRegimenLine] [nvarchar](150),
    [LastARTDate] [datetime],
    [LastRegimen] [nvarchar](150),
    [LastRegimenLine] [nvarchar](150),
    [Duration] [decimal](18, 2),
    [ExpectedReturn] [datetime],
    [Provider] [nvarchar](150),
    [LastVisit] [datetime],
    [ExitReason] [nvarchar](150),
    [ExitDate] [datetime],
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [FacilityId] [int],
    [SiteCode] [int] NOT NULL,
    [DateExtracted] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.TempPatientArtExtract] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[TempPatientBaselinesExtract] (
    [Id] [uniqueidentifier] NOT NULL,
    [bCD4] [int],
    [bCD4Date] [datetime],
    [bWAB] [int],
    [bWABDate] [datetime],
    [bWHO] [int],
    [bWHODate] [datetime],
    [eWAB] [int],
    [eWABDate] [datetime],
    [eCD4] [int],
    [eCD4Date] [datetime],
    [eWHO] [int],
    [eWHODate] [datetime],
    [lastWHO] [int],
    [lastWHODate] [datetime],
    [lastCD4] [int],
    [lastCD4Date] [datetime],
    [lastWAB] [int],
    [lastWABDate] [datetime],
    [m12CD4] [int],
    [m12CD4Date] [datetime],
    [m6CD4] [int],
    [m6CD4Date] [datetime],
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [FacilityId] [int],
    [SiteCode] [int] NOT NULL,
    [DateExtracted] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.TempPatientBaselinesExtract] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[TempPatientExtract] (
    [Id] [uniqueidentifier] NOT NULL,
    [FacilityName] [nvarchar](150),
    [SatelliteName] [nvarchar](150),
    [Gender] [nvarchar](150),
    [DOB] [datetime],
    [RegistrationDate] [datetime],
    [RegistrationAtCCC] [datetime],
    [RegistrationATPMTCT] [datetime],
    [RegistrationAtTBClinic] [datetime],
    [Region] [nvarchar](150),
    [PatientSource] [nvarchar](150),
    [District] [nvarchar](150),
    [Village] [nvarchar](150),
    [ContactRelation] [nvarchar](150),
    [LastVisit] [datetime],
    [MaritalStatus] [nvarchar](150),
    [EducationLevel] [nvarchar](150),
    [DateConfirmedHIVPositive] [datetime],
    [PreviousARTExposure] [nvarchar](150),
    [PreviousARTStartDate] [datetime],
    [StatusAtCCC] [nvarchar](150),
    [StatusAtPMTCT] [nvarchar](150),
    [StatusAtTBClinic] [nvarchar](150),
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [FacilityId] [int],
    [SiteCode] [int] NOT NULL,
    [DateExtracted] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.TempPatientExtract] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[TempPatientLaboratoryExtract] (
    [Id] [uniqueidentifier] NOT NULL,
    [FacilityName] [nvarchar](150),
    [SatelliteName] [nvarchar](150),
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [VisitId] [int],
    [OrderedByDate] [datetime],
    [ReportedByDate] [datetime],
    [TestName] [nvarchar](150),
    [EnrollmentTest] [int],
    [TestResult] [nvarchar](150),
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [FacilityId] [int],
    [SiteCode] [int] NOT NULL,
    [DateExtracted] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.TempPatientLaboratoryExtract] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[TempPatientPharmacyExtract] (
    [Id] [uniqueidentifier] NOT NULL,
    [VisitID] [int],
    [Drug] [nvarchar](150),
    [Provider] [nvarchar](150),
    [DispenseDate] [datetime],
    [Duration] [decimal](18, 2),
    [ExpectedReturn] [datetime],
    [TreatmentType] [nvarchar](150),
    [RegimenLine] [nvarchar](150),
    [PeriodTaken] [nvarchar](150),
    [ProphylaxisType] [nvarchar](150),
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [FacilityId] [int],
    [SiteCode] [int] NOT NULL,
    [DateExtracted] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.TempPatientPharmacyExtract] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[TempPatientStatusExtract] (
    [Id] [uniqueidentifier] NOT NULL,
    [FacilityName] [nvarchar](150),
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [ExitDescription] [nvarchar](150),
    [ExitDate] [datetime],
    [ExitReason] [nvarchar](150),
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [FacilityId] [int],
    [SiteCode] [int] NOT NULL,
    [DateExtracted] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.TempPatientStatusExtract] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[TempPatientVisitExtract] (
    [Id] [uniqueidentifier] NOT NULL,
    [FacilityName] [nvarchar](150),
    [Emr] [nvarchar](150),
    [Project] [nvarchar](150),
    [VisitId] [int],
    [VisitDate] [datetime],
    [Service] [nvarchar](150),
    [VisitType] [nvarchar](150),
    [WHOStage] [int],
    [WABStage] [nvarchar](150),
    [Pregnant] [nvarchar](150),
    [LMP] [datetime],
    [EDD] [datetime],
    [Height] [decimal](18, 2),
    [Weight] [decimal](18, 2),
    [BP] [nvarchar](150),
    [OI] [nvarchar](150),
    [OIDate] [datetime],
    [Adherence] [nvarchar](150),
    [AdherenceCategory] [nvarchar](150),
    [SubstitutionFirstlineRegimenDate] [datetime],
    [SubstitutionFirstlineRegimenReason] [nvarchar](150),
    [SubstitutionSecondlineRegimenDate] [datetime],
    [SubstitutionSecondlineRegimenReason] [nvarchar](150),
    [SecondlineRegimenChangeDate] [datetime],
    [SecondlineRegimenChangeReason] [nvarchar](150),
    [FamilyPlanningMethod] [nvarchar](150),
    [PwP] [nvarchar](150),
    [GestationAge] [decimal](18, 2),
    [NextAppointmentDate] [datetime],
    [PatientPK] [int] NOT NULL,
    [PatientID] [nvarchar](150),
    [FacilityId] [int],
    [SiteCode] [int] NOT NULL,
    [DateExtracted] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.TempPatientVisitExtract] PRIMARY KEY ([Id])
)
ALTER TABLE [dbo].[PatientArtExtract] ADD CONSTRAINT [FK_dbo.PatientArtExtract_dbo.PatientExtract_PatientPK_SiteCode] FOREIGN KEY ([PatientPK], [SiteCode]) REFERENCES [dbo].[PatientExtract] ([PatientPK], [SiteCode]) ON DELETE CASCADE
ALTER TABLE [dbo].[PatientBaselinesExtract] ADD CONSTRAINT [FK_dbo.PatientBaselinesExtract_dbo.PatientExtract_PatientPK_SiteCode] FOREIGN KEY ([PatientPK], [SiteCode]) REFERENCES [dbo].[PatientExtract] ([PatientPK], [SiteCode]) ON DELETE CASCADE
ALTER TABLE [dbo].[PatientLaboratoryExtract] ADD CONSTRAINT [FK_dbo.PatientLaboratoryExtract_dbo.PatientExtract_PatientPK_SiteCode] FOREIGN KEY ([PatientPK], [SiteCode]) REFERENCES [dbo].[PatientExtract] ([PatientPK], [SiteCode]) ON DELETE CASCADE
ALTER TABLE [dbo].[PatientPharmacyExtract] ADD CONSTRAINT [FK_dbo.PatientPharmacyExtract_dbo.PatientExtract_PatientPK_SiteCode] FOREIGN KEY ([PatientPK], [SiteCode]) REFERENCES [dbo].[PatientExtract] ([PatientPK], [SiteCode]) ON DELETE CASCADE
ALTER TABLE [dbo].[PatientStatusExtract] ADD CONSTRAINT [FK_dbo.PatientStatusExtract_dbo.PatientExtract_PatientPK_SiteCode] FOREIGN KEY ([PatientPK], [SiteCode]) REFERENCES [dbo].[PatientExtract] ([PatientPK], [SiteCode]) ON DELETE CASCADE
ALTER TABLE [dbo].[PatientVisitExtract] ADD CONSTRAINT [FK_dbo.PatientVisitExtract_dbo.PatientExtract_PatientPK_SiteCode] FOREIGN KEY ([PatientPK], [SiteCode]) REFERENCES [dbo].[PatientExtract] ([PatientPK], [SiteCode]) ON DELETE CASCADE
ALTER TABLE [dbo].[EMR] ADD CONSTRAINT [FK_dbo.EMR_dbo.Project_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[ExtractSetting] ADD CONSTRAINT [FK_dbo.ExtractSetting_dbo.EMR_EmrId] FOREIGN KEY ([EmrId]) REFERENCES [dbo].[EMR] ([Id]) ON DELETE CASCADE
CREATE TABLE [dbo].[__MigrationHistory] (
    [MigrationId] [nvarchar](150) NOT NULL,
    [ContextKey] [nvarchar](300) NOT NULL,
    [Model] [varbinary](max) NOT NULL,
    [ProductVersion] [nvarchar](32) NOT NULL,
    CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201702281916375_Pilot', N'PalladiumDwh.ClientReader.Infrastructure.Migrations.Configuration',  0x1F8B0800000000000400ED5D5F6FE338927F3FE0BE83E1A7BBC56C9CF4EC36661AC92E92383D134CA7E38D333DF7D660643AD1B52C79243993E0709F6C1FF623DD5738EA3FFF4A2245D2764C0CD0135364B1542C168BC5D28FFFF7CF7F9DFEFD65158C9E619CF85178363E393A1E8F60E8450B3F7C3C1B6FD2E59F7F18FFFD6FFFFE6FA7578BD5CBE84B55EFFBAC1E6A192667E3A7345D7F984C12EF09AE4072B4F2BD384AA2657AE445AB0958449377C7C73F4E4E4E26109118235AA3D1E9DD264CFD15CC7FA09F9751E8C175BA01C14DB480415296A327F39CEAE83358C1640D3C78369E8120000B7FB39AFEF1747419F8304CEF2058C0F8E83A5CC62049E38D976E6278340529188FCE031F2026E730588E47200CA314A4E8153EFC9AC0791A47E1E37C8D0A4070FFBA86A8DE1204092C5FED4353BDEF5B1EBFCBDE72D234AC48799B248D5692044FBE2FC536A19B2B097F5C8B1509F60A0D40FA9ABD752EDCB37121CA8FC0F303F4603CA2BBFC7019C459F5B611B88C90DCF3213C22C97D376A6FF45DAD5A4803B3FFBE1B5D6E826C18CF42B8496310200A9B87C0F77E81AFF7D137189E859B20C0DF08BD137A4614A0A2591CAD619CBEDEC165F59E88BDF16842B69CD04DEB8644ABE2FDAFC3F4FB77E3D167C400780860AD3498ACE6297AA99F60086390C2C50CA4298CD1985F2F602E76A67FAAB7ECDFAA37A4A5682E8E4737E0E5130C1FD327344BFF8A66DF47FF052EAA9292835F431F4D5DD4084D02F625A94EAE56B1F13ED0CFFF865EAAB99FD349A3BD3D741A893FFBDF799C5EBD2055CAD8D1A2DC0CDD1DD2F2EB85BC8E676D0A21FCB4F1171C056F1FEBE9ED45D51E995E78EFAF3A9B9C3FC2AB308E826085045537869EBF02C178348BD15FE5BAF4C37834F740C6CBBB1E44CFEFEEE729887592FC8456962FA8A9369A77F0D1478B55AE7E99BC646587AC0BD22BF333B850F279B4893DF336291F35347A2A0241E3F0EC479BA41AFC8134B2F1416A69ED95CFD3FB273F69D65F39C6732A56592E3BFBE487E6D5229B7C8A5A9135B52517AC2F2B62996EE2D21BD46392AE5ED668B1868B3B88D6A4507EEE44CFBE0D93C49AE29E1C5EBDF8D9729C44E65521EB4AC90015E676F64B97B3D98BCCF5D4BC2DF053D8C7397EABBE28B71F0F2609ACBDA98B280A2008BBDAFD630337B0F1C14C5AEF749358EAA67B0EA839F317208101B2B18911979EA67ED88EFDC3E5F42FD4F4EE6EA062FC1E7E3BBF90EB083550EBE8E75BC98E7EBE55E908CABE11547C23283B4650718CA0ACE8A0A2E802B4CACBF655B651ED4E5686651BE5B793D48DB28D4A77AB9377B22F573451EAECBD745FEF15BB72EE9273979CBB34EA74978C7849BBE71C61E660D25DBB998BB20E9526B3A3C7185421232B870696A28E0AB1E4A1F154BCFD797A79793988C0FDECE6FEF27E180FF717682E21A9292E8A9642B619CF16022AD34C30BE85F5E88B8F66DFA379B95D46618AACE71D0C8818DEEE45CD6E40ECA720B0B40E5E2D365E2E904FF01906E6D50A6426385CFAF10A2E7EBEFE328B9084FCE7210707572FEB2841AB9B05CF69F8814731AA84BD33ECE29CA7846934DE1B6D4577CE911D189DB1B777794BBB8E03DD3DA0969FC1B3FF985B587A41E2273520E6AB352A79F2D7452A157723F0554CE1631CADEEA240B02D1136FC5AFB30914AEB7B103FC2545102740C58550E1C3A32D2609A2BC884A53148329FC043847CD4287E1D281A1E2119D9B0ED1584C32132483AB32710AF803754362C1919C9D0AD15E4C290182495C2400D94094D444622645B05795004064923F7C3070A83A221230BA2A98228C8F63C49A845A998A9A8375EC590DFA1C8D5168EF5F2516C68F40AD4DFC648367071F1AA1661594771AADAFA1E26A99DBCD83A2331EB524A3C59833B98201DB19597E74E3EF6770FE24E3E2C9C7C506E8CDE158522EED613CC90F43298D378F368639ED9494C9CFAC91A86095459DE762B97F33E8620CD9740D4CCCA1182AD9CD9198CFD68710FBE59C807CE7E3EBD06E0C54FACC8D1F904CE27703EC1A8D32720B6F27A3D0282F461FB03790A3C4CBCD85F5B39E0544DB9B7F8558033D0CE403B033DEA34D0788051AF7DC6291FB6795609FFE56D94D20C60FCEC5B4846CA19B4E26BFFF6F32D9A038FB465EC68747E413432991AF21882D0BC39FC7433935E6FA753D9263F43FFF149DB97D7BF69A57631332EE4DB6B0B5D284DEBCD4382ECF826B3CA1FFD3849B353E67237AF9B9E25170D67610EBD285C687C2786A0AD97A2FBBD7C02E1A3529C4A40CAD28B9C2F9E600C430B2B49DDD32512CC6314BF1AEFF12358F9C1EB2C408E0EEAE006A64F91797771F68779F3F5134C0AC7EDBC59F9865ADDCFF0253D5FAF233FCCC394EEDB21B719739B316D9BB1AB9BBBC1DB2E44E3B037585692154A01DAF85A2144331A7585A466BCB7EB640A97004BA3A8E7B5AC712E0C91EC480AB3B8CAC8C11CA6297A737EEA1652FCAF4CBD263D8BF39849C1E2D519946645121B3EB709726E9A5B39590E80F989570EEC65F26CABABF9EF6D1FF9FC707CAC457CC803F5433BDF59DD81F05B7F2F5752D9AE93730FFF3C49D52E5E27B3D88F620C684C95127227A526506F9355FB90036D5549E7B08D14BE6D30A6F9662CA1782D5EC5FC05B81CF1AF458566E5C5CB992597783868ADBD87ABB57EC8D182DF232EF1C3D66DABDFBFBFA5DDB3036CB50AD86AF7B37C4B400D0EB0D501B6723A7480AD7C8BBB5349BE3307D83A3C7B6CEF4E112A832599FAA1E7F021936AE9B43641FB46D47A768E988FAC1D269475C31D5628DEDC61853AAC508C4187154AB57158A1544B7B58A16F69EBEEBC8E5DF63ACC391BCEC78096037E73A42601EA0D5AE9CDC16BF623B04D784D4B809776C3850E5ED3C16B3A784DEDE16907AFE94EDEC4B6DDB9EF3BE9BEEB8721631D79874576282EFD5BB25B0E324E30C60E32CEAD3A03571DDD4065EC9AE3D0CA1853E6D0CA1C5A99ACDC1C5A99738CDCD2BA4F4BAB5EBC2F766175A05F2E195B4BFE99434B7346755F8CAA568C2ED6A63AA02E6752B710AD720867754F0EE1AC38D8750867078C70F69601A71C7A9B436FB38ADEE610CE1CC2D9616DA0CE9324F2FC5C35AABC34A98B334986AFC2C568D02D9AC5E889EE9743038A764DFE1AED93D0ABA03125BB470CDC865318C0148ECE732828C407483CB060458BC4B1D0C37B05C520E21D875820D9FF13C315DAC6654B6CEA83E0320AB34C5034B9D83D9F1F7AFE1A0443444D11E56E25B1D939E953BFD172BAFAE9A4669A7E3285EB2CA5384C8708DFF6DBD44C534AD5357EA7136CBE0D9D86ECBDADEA0ADD7289EB9E4C49F115B2A237603FBDDCD2F4140A7F8F27A970380E72AA72EE1156D7F4B64B85F764B2B65C692C7A054ECEE396A6AB58FE7B3C5FC52372901396B9DC5A5DD7C5375DEFC96415DEB32D7A0126516C4B135524F93D9EA6A2B138C8494ADDB6AEAEE1A2ABD7F764820A2E7E17B14F259B6C6972F265BEC753933F0A073931F1A3F121F392A0B377D392E4BE6B5692D90A5B9A945C81EFF19CE40EC11B9C923C447791E2B6C2BB37CA99DFB0606526B561C9E30C5108F146A6488B70FAA8019B7C23A5D02D92E8D37B8974BD150D9CE190C6A2919E71F18D9B21AEF36EACE8DD8C07A8DC3E033469194F0E16D48BF7C2BD8C6173478505DDBACACFA97274043F847175F6F50758FB777015E59FEBA7F08597D2F76B02CBACBEA43CCEA3C73E238DA616E1C994677A3E4CC6A3ABFA908C58A31B0CD5491F8A9C73321165CE21914C17EC194047476CD05BA6BBBEBD2811E704493BBAE1C404653A64823C1DDD31710D99CEA8CD6A4757D41E4DA623D2F9EEE887F43A3BBA29E0EA1982B99DEC6A4A5F37C352A196F70E82A54DE251AA57910E125CA47A1E41015E7E7FF27D66692B2668FFAEFAF5A040B8D7EC6CC728E8DF598F99D9F6616AFF8E3A67A5F8239DFE9D74CD4861CE3AD505B660B6DB6771BAC608A3D162B87BE67B486E8879191FB5D8842B0DE3720C4DD4107549C889F62349D96B19178E5550199D8E3480C1C7E896464A7C7E2FEA98233F0BA3C6B3832AC3D67524ACEF50D8F0C0B59CE58A7AE6C9D0C2D0B1AB8ACAC0B51F0DEA3A1C343C68C2333D51BFACEC2C0C18BD3AAB0C57DB21919E6322C3432538DD11F54ACBCCC23051FE8DCA28B59C18683933303C46FC50BFA8534A5E8347887B9F273B0A9D41E2DE6162ECC58A3D618BF0DAA2BB381D9AFFC1522122921C71882396DD314B8CF16623DA22046EA8B1438A2DAF5C2573D741B2FAD9E964EE3DC115280B4E27A88A07D7E90604F977AC49F5E006ACD799A09B9665C968BE065EA6F47F9E8F472FAB204CCEC64F69BAFE30992439E9E468E57B719444CBF4C88B5613B08826EF8E8F7F9C9C9C4C56058D894748940EE9D53D210F0064F775114F8BBB00F3CF73A620050F204B65BF5CAC986A9C90A0604B56752888FAB1E3566DD0AA86D9DFD5C190E83BDFEB701983248D375EF65DEF51C63B1D3D6483AD65071F911CB26F28729140C66E88092012D9E71A20A63E1528CEA22EA360B30AF112F6304B44A1F89817A75094F4A7907FA98B13C80BFAB7AFE338380D4170A750764A9A4CAC9A1958E6B08054180975EAB555D6AB566C484A55BF7A50120D527628808F0FEF9040DC3A87F9C69BE705FDDB53B7FDE194A84752349BCBFE288ACD03297A18F43245107BD29F228B748E53659FF6A75CA1BBE3F4AA3289895B7AA2E562494C5FF2517F9AE4357E3849F2898C79E1A12793B6865743A987FABE3801FDFAB9BC44E85BFE78B2A1EB48F6C2E59E7CA246B1802813512D9EF6A74CDCE98713251EC8D1E3BE3AF140891EFBE2CC43092B5A63DD11A6B42E9558B229943B62F5A69E492DE4256020B59297A57212E41852252B8AE30491EFD994CB516315AF2995B69E59EA11C772F233923A68651FC6726865C512F3B64E7122E6AB30F1A94556961DC3163A1E4C12B8602855C5FD69FD630337907686EA4229EB98DFB240D9C4BC4C960A77ADACCB77D381EE739A61C48D660E5D073AD3DDF4CCB8D4C5FD8678FBA2448E02AB3A4DA904A5FC5238824A5E224781C34B5D2A4329BB7E8FA49295C851E0F15295F6A70419B94049B940AE5CA0825C20A32F50525F20575FA082BE40668CA0E41841EE18418531AA6F6CC409D585D27458A6880772F49821AB0BA5E9F0F95218BBFA0E48E61DE5349BB81792434B96AFEAB2489C5455264B85650A2F97A0F69E65E9BD2C47EFF90CBD57E0C7B99C9D6FE55CCE5E54F6D1E5B4ED696A7230A5FD4A9DB35CDFCC24C143716AE413DB41CCA1A16973415ACE459522D2E56345DAD51D9642EA550555DE9BABD9C42FD0D4D96E00BABA5493E6542E4CD4DC6249A8565DDA9F527D4D254EA82EEC4F87B986923C34A41E6E275447DD4089D3A31E497804D43D938473403D93185FE17592C4780B6B291D2E34174E0A4E179A0ABB743C425C3DC9BA0CD2B68BBA5E924751DA5EB19748F2C82AD9288D9EE0B088914E8F7D57FC6CE71BEBF18D7B65291BF192D9EF4706FACB3D089A995F35CA3BB9529785FDE950F714E2D4A847325E0D797D21E9DD90CFFA536DAE35C4E935A512F684BAB790302DD43339FEAA2B0D690EAB72173DD93DABEEA22714AD1D58217A7C0E61647DA03FFA1BB83A749233B9364C796B83D45C2F2E7E24F61879C9369234C86B1BA97D2EF6E4ED24B850D73B124B0AF9482EDEC04D14524C129AE1173512438C3F90D217F232464A6DC8876E3575AB692F291FF86ADAF9B59A91B594FCB27DE04ADA41CCCC3ACA5C4EC864E1E10FB791D6A737DDD059C9CEB77256B217957DB4925D5F8B1A31920434C7401BD94E6BB7C350D805840C25E92380EA4E4242FFAA42499E5837142BEE4FABB9551027D5944A50AAAF1A2428D5A5528731E55D82D4014C592A712C975D16481CC865051266794A2D137941FFF6D535823889AA4C42B21C2ABF4953B9A04471212589EC464022067B2DD79A13C5BD969E3F9D17E41113ABB3B69E9E796E4E9FFA6ABD0B6ED113752EA8AEA9EFAE57173690B1992D97ED9176B4A5E2E0FEB86FDA5EB57F9FD8A596387DAC588156736D259766F358267989775F2099C4C4AB2161F9FFA08C545E20930C855FFC47A644E14FFA53E45EFB8713E656705B1BB7B5E925E5C3DBDA080048746D6232784EF9ED0AB795998D49F62F654180DC29F11718274CD4A72E94CA850B618E28FD0BA49609EA91446E4E32854BC01C3563C5D2139F16F74C8CCFBC3DA5EE041AD2A6DF2470AC82AA7710D855ADCF4ED30240E9695D281399CCDFFF3279A623934DB934B5F9EF744E25562EF18EC849F143DEE11FFE40E2540D84DFA8E3B4BC44663E6798F3744667532A436916FB51CC8036E0E5524E05AD9082FB00B66613661554963963507941F25640D8D2CCF4B709D0B4A5E116E06B9B1B7C3E4EB7BC2AF4A4634631F47F0FB32BDB0D07F6B45B604F26BE92D1F3ED95037B1249C4813DD507190EEC692773E1660EECE90D043B2BEB41FB3278F93642A7997C4B878C0E5B528F76D10DB6096ED4769FCC2097D8011B3960231125076C247A2B076CD4879E0336EA4FCF011B75D3DA95D08773F30EC9CDB3EBDD6971EAF63EC839476A11A0869025493DB21DCC724042FB0B24A407F4C744A0D501093920210724541AF8830612723E6E3B2DE7E39AF071AD0203B55E2B3DC8EFDD1A28D07E78C0BB625B1C84125D2A31860E42C9AD1D38C5ADAF1D162183C4BD0E5B371C5C90830B72704172FA62042E68573C14B7821DD20A660DA647D4E7B0D56B2B103D6F37B1D9810F395BD74669BF6D9D2DB01D4197C32CDD368076DEAEA1731042FD683908A1B6F60E42A80E47EE0084D0BE40AD38A8230775F416A18E1C84D0E14008B90D8AE406A57A98A70FA1B916D355EADECB92FA775215649B03E42ADD20910449D36EEE3DC115C8DF3F59030F16DFDFE7E63ADB8D3C80041655C6A32AA88D64FB9AA470556C57E6BF07C596A6A97003427F89A6C47DF40D8667E377C727EFC6A3F3C00749662F82E578F4B20AC2E483B749D26885A67354CC9EB3F1539AAE3F4C2649DE6372B4F2BD384AA2657AE445AB0958441344EBFBC9C9C9042E5613BA7949B61795E31F2B2A49B208F01D11B693AB12BAF2D7ABBF232547ED17F84A0F74A554777059A784B17A783AA19B9E52DA58B4CA18391BFB997CF3FDDD4F100D3F52C6059A79298CC36C57067396C7A3CF1BB4D17C0850FD250812B64BDAFCE4DBAFA283F019C4DE1340DBA91BF0F209868FE9D3D9F8E4AFC73851B44FEDA499EFC8F492AC376843C8E2D3AFC76877C01EF41B76D68C750FFAAECA8F4BB682472B083F6439887234AEEBC69BD0FF7D03FD5C95977E767226A9CC793671416B81A647EA67BA2DC70D859E5012839EBF024166DDD05F496EA64E7E4093112D20E8F13B854E1A4005635D6059A166FA60F3AD87C9BECA27D7ACA3645AB15EE22406C3B0D7E7A77E6AA3597FB76F460234D2C230BE498C05031C1347C17AE913A00BC3C440E02DE8E7D2A0109A0C0333B687CE38183A4DAA5C0DFD42264DB02283F8E1946667AD3E421B28C2664389B9ABB47FFEE11A99F897B3F1FFE4AD3E8CAEFFEB6BDDF06BB55DFB6E9427207E181D8FFE57DA07C036A39ACD46BD99D4F67E270AEF57E3C86A378AF9B71E26A8CAAB979AA7DE8EC6E0FCF59DF3D70BD00A6C3AC971D2A0550C335D055E853A1BF507EB43D9C8400706B051E10C0C63030E9306D4240D384C37A026DD80C306056A1A941A934299130289623833C34687809FD02099411A4B604E0C63A6C29C50E605879A18C8CAFB819CBCD7C488730C9D63B865C770803FD8724EC6A92D3A70EAF621F9B3445205B89A2849E3B09C59320B4D2F7F66C2991A62DCBAE3B61C700C8D042B3C0C9D3C36DF966B59DBCCC4962B700DCDFA53C362E8A55BA364E825CB8065EC68808E82CCD01CA3A3A033346B84103843DBD9438395A17B09D07F6442006598F07A6AC40C33C469DBA68BBEC6B88F3157DCF9C0421FB803DDC14547772E3A5A7F4CA0BC87A7701C867A50247EC3306A0D7A83E6A592427150961D0EDE602421C105445C40645B8B412B64835B0A767429980E306705A685762119C99A20B12E86AD33FB958742415EE88F2718CAF699E14018DA958CC4C3708BB15B8CDFD462DC8240E196E29D5B8A190C8BDD4CC7339730E82CA6B3985BB69862240B673077CE600E0F636158180343FB151486EEA3AF1A17432FE106254359760D3C86F69397122C43F3815C869F3170E99B4E8792A82034CCEC197F334AFD62A67B4C32280EDD14B54CE74E600B73F4CDF8563D102BF4BD92109442F33BB5E1510CB5E7ADC0137ADF0343813144B88182D1DB011F3443F37AF08776B343226A9831965C700D2D39416E7FE4F64716F747573777B676421AF706264E80BFC038311098B98CC2106DD61065241FEDB935C9142E0176D64C6DD9FA4DF8623BD9363C7D66694545C2F8F4D7D262CF3E87698A5622A7B0F5715700B4EB5429EBCBE4D910E5F9EF4C2AE27FACC0CB7F4ABF3F5AE7FDD0487AE71D08BFA9B80EBD74E13A39F7F03C4995397B9DCC623F8A31C404152A57AB78E0ACCF299898F1558C6BFFA63AEEE2E8D2C7E1E6A3B7E031E05FFB08461A87C1E4171AFB13D375C84678177B876C64F43B1133DF19396423876CC404E71DB2D1BE659499CAD13B7864A35D89C6E178B9CAA7843A3E1CA6D071C5321FB29DC0BCDA6DA1FD38FC1B4E73877F833777F8377873877F23A2E0F06FF804DE14FECDFE04199CA3B3938ECEFEFA37266377D43DEEFB105271D02D3B04DD62065DC568A0CF41B718894038E896B6E0AA836E2148EF25748B73419D0B3AC805FDB42DF018E78CEED3EC758835878458E3ACF296ADF296505C1CAE89C33591354D0ED784A36426714DF6C769708BCB4E2E2E5B4125D913777F7F2697432B71D66517ADCB36103C9C71D9B9EDBE43F650979D43F670C81E6F15D9637FB1161C26C9A05772982492FEA343F610F4610DD9C3ED252CEC25CE9324F2FC5C67AAEC12CE056F5F89C2E6B3D784DA625C858BD15D1408A8542CCF61B03CE257B8D904A9BF0E7C0FB18A068B248F3AB80DA73080291C9DE78811A81F907880772F1C62A5176FD837BC42F6F03A24877F623A465BA96C214C7D105C4661965E85869ADD77F9A1E7AF41D0262DAA1177BBD6728B1EB7BEE81EBD4C623553F493295C67697B61DA213FDB0CD77C5143DF3504A7134CEB874E06FA6B99373025980F80844CB235DDF490B93ADD02DB3B314998349737304BD8D41D21979CAA6E9E48DDA26581EF9D982854E6C11B9826742E859047A6A29B2212770B59E07A272608717AFA06A607791A2CE490AAE6A646EF9B3E2CF0BC1313033FF87B03F38238C7143248D672B3A2EF6D0E1658B63029AE6EEEBE92C09762C5CF605C7135CA7F5B516B0A9A9360827A64448119005BC160B227FF529AD786402AE8B14457DC8AEE9427F7193EA35869A8E3FD7CCCEA323BCAD3ADB69AD464C6C39334A42A3D3572D6E0EE5AD091AB3C3E9E7F5BE98730AE165E64DEF2E3C02948C1034820A32C592BA4F5C442DD609A5DD5517762FD6A2ACCBD27B80267E3C5438446BA88DF374F277D7AE344A905DD726AF2FAE7549361848D0AB6B3C3D66F618AAD2CC35A4F8EFA30A2D43F2712D4CE09A7410B4F9CDA32DC315BF076DE98EA2D9C317565F8A2763FED5C51955B78A26ACA70443A9EED0C91755BF8212B76B093AF044CC77929AF8BFC411749CA1D61A95315B81D51753AFAAC9753A6B3FA095762D5C30EF27CB05EB633413D5ED782AAFD19E9611E5B6B7730256D20398828AD1CF56544A1FF3EE6B1BD7A074FF206B2E5B3B056DE7A19C7B6FAFDF9EA328FE2AA1D3CC919485116722B43DDC6515899620773EBDA177F7132C308A3D1E216F4CC86E81178A94528AAC0F8BD3DB21844445BACD584149E16C1B207E34AE2ED385FB7296491E1664977DA601302E71CB22A49BCEBB0D6A6C8850B024BBBDBB49B103A7360A724F2F6633F9B0217AC712CE5AEF5CA84B0A9C31F2551B71D20D9143477D166E9B62FC126844C1E2428C9B8E52CC2A688795E084BB6D5A99017302F28CD116267EC9A0D03622FC0D9CDB5C69CF1A6EDFB33F9172622A99C3715475AF9B1568C57C12E4F56342D2F55A5C5D661BFFAD9E9A47046CB02F4132D2DE011DE440B182479E9E9E46E1366B9B7C5AF294CFCC786C46973B15943B4AA731D2EA32AE049715455A1927F6F600A162005C88BF397680067C565D4F9187E01C1268FA73FC0C57578BB49D79B14BD325C3D04440C318B9AB6F57F3A61783EBDCDBF6F4D74BC0262D3CFD2956FC38B8D1F2C6ABE3F72D2950524B270EC4F10951763895439858FAF35A5CF51D8935029BE3A8A9CED3202442CB90DE720C37993E7EDD7047E828F68496C602E4444BA078214FBE9D4078F315825258DA63DFA897478B17AF9DBFF03B1A48EECC7060200 , N'6.1.3-40302')

