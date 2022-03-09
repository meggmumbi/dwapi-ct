using System.Reflection;
using AutoMapper;
using log4net;
using PalladiumDwh.Core.Application.Stage.Repositories;
using PalladiumDwh.Core.Model;
using PalladiumDwh.Shared.Model.Extract;

namespace PalladiumDwh.Infrastructure.Data.Repository.Stage
{
    public class StageCovidExtractRepository :
        StageExtractRepository<StageCovidExtract, CovidExtract>, IStageCovidExtractRepository
    {
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        private readonly DwapiCentralContext _context;
        private readonly IMapper _mapper;

        public StageCovidExtractRepository(DwapiCentralContext context, IMapper mapper,
            string stageName = nameof(StageCovidExtract), string extractName = nameof(CovidExtract))
            : base(context, mapper, stageName, extractName)
        {

        }
    }
}