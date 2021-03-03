﻿using System;
using System.Reflection;
using log4net;
using PalladiumDwh.Core.Interfaces;
using PalladiumDwh.Shared.Model.Profile;
using Quartz;

namespace PalladiumDWh.DwapiService.Job
{
    [DisallowConcurrentExecution]
    public class SyncContactListingJob : IJob
    {
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        public void Execute(IJobExecutionContext context)
        {
            var profile = typeof(ContactListingProfile).Name;
            var profileBatch = $"{profile}.batch";
            try
            {
                var reader = Program.IOC.GetInstance<IMessagingReaderService>();
                reader.Initialize(profile);
                reader.ExpressRead(profile);
                reader.ExpressPrcocessBacklog(profile);
                reader.Initialize(profileBatch);
                reader.ExpressRead(profileBatch);
                reader.ExpressPrcocessBacklog(profileBatch);
            }
            catch (Exception ex)
            {
                Log.Debug($"error executing {profile} job");
                Log.Debug(ex);
                JobExecutionException qe = new JobExecutionException(ex);
                qe.RefireImmediately = true; // this job will refire immediately
            }
        }
    }
}
