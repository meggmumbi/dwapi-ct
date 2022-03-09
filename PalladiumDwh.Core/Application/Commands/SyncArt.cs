using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using PalladiumDwh.Core.Application.Source;
using PalladiumDwh.Core.Application.Stage.Repositories;
using PalladiumDwh.Core.Interfaces;
using PalladiumDwh.Core.Model;
using PalladiumDwh.Shared.Enum;

namespace PalladiumDwh.Core.Application.Commands
{
    public class SyncArt : IRequest
    {
        public ArtSourceBag ArtSourceBag { get; }

        public SyncArt(ArtSourceBag artSourceBag)
        {
            ArtSourceBag = artSourceBag;
        }
    }

    public class SyncArtHandler : IRequestHandler<SyncArt>
    {
        private readonly IMapper _mapper;
        private readonly IStageArtExtractRepository _stageRepository;
        private readonly IFacilityRepository _facilityRepository;

        public SyncArtHandler(IMapper mapper, IStageArtExtractRepository stageRepository,
            IFacilityRepository facilityRepository)
        {
            _mapper = mapper;
            _stageRepository = stageRepository;
            _facilityRepository = facilityRepository;
        }

        public async Task<Unit> Handle(SyncArt request, CancellationToken cancellationToken)
        {
            try
            {
                await _stageRepository.ClearSite(request.ArtSourceBag.FacilityId.Value, request.ArtSourceBag.ManifestId.Value);

                var extracts = _mapper.Map<List<StageArtExtract>>(request.ArtSourceBag.Extracts);
                if (request.ArtSourceBag.EmrSetup == EmrSetup.SingleFacility)
                {
                    if (extracts.Any()) extracts.ForEach(x => x.Standardize(request.ArtSourceBag));
                }
                else
                {
                    var facs = _facilityRepository.ReadFacilityCache();
                    if (extracts.Any()) extracts.ForEach(x => x.Standardize(request.ArtSourceBag, facs));
                }

                await _stageRepository.SyncStage(extracts, request.ArtSourceBag.ManifestId.Value);
                return Unit.Value;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
}