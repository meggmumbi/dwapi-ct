using System.Reflection;
using AutoMapper;
using log4net;
using PalladiumDwh.Core.Application.Stage.Repositories;
using PalladiumDwh.Core.Model;
using PalladiumDwh.Shared.Model.Extract;

namespace PalladiumDwh.Infrastructure.Data.Repository.Stage
{
    public class StageDefaulterTracingExtractRepository :
        StageExtractRepository<StageDefaulterTracingExtract, DefaulterTracingExtract>, IStageDefaulterTracingExtractRepository
    {
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        private readonly DwapiCentralContext _context;
        private readonly IMapper _mapper;

        public StageDefaulterTracingExtractRepository(DwapiCentralContext context, IMapper mapper,
            string stageName = nameof(StageDefaulterTracingExtract), string extractName = nameof(DefaulterTracingExtract))
            : base(context, mapper, stageName, extractName)
        {

        }
    }
}