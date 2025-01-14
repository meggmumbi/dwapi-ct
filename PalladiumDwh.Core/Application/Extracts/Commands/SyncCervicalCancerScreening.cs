using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using PalladiumDwh.Core.Application.Extracts.Notififactions;
using PalladiumDwh.Core.Application.Extracts.Source;
using PalladiumDwh.Core.Application.Extracts.Stage;
using PalladiumDwh.Core.Application.Extracts.Stage.Repositories;
using PalladiumDwh.Core.Interfaces;
using PalladiumDwh.Core.Model;
using PalladiumDwh.Shared.Enum;
using PalladiumDwh.Shared.Extentions;

namespace PalladiumDwh.Core.Application.Extracts.Commands
{

    public class SyncCervicalCancerScreening : IRequest
    {
        public CervicalCancerScreeningSourceBag CervicalCancerScreeningSourceBag { get; }

        public SyncCervicalCancerScreening(CervicalCancerScreeningSourceBag cervicalCancerScreeningSourceBag)
        {
            CervicalCancerScreeningSourceBag = cervicalCancerScreeningSourceBag;
        }
    }

    public class SyncCervicalCancerScreeningHandler : IRequestHandler<SyncCervicalCancerScreening>
    {
        private readonly IMapper _mapper;
        private readonly IStageCervicalCancerScreeningExtractRepository _stageRepository;
        private readonly IFacilityRepository _facilityRepository;
        private readonly IMediator _mediator;

        public SyncCervicalCancerScreeningHandler(IMapper mapper,
            IStageCervicalCancerScreeningExtractRepository stageRepository,
            IFacilityRepository facilityRepository, IMediator mediator)
        {
            _mapper = mapper;
            _stageRepository = stageRepository;
            _facilityRepository = facilityRepository;
            _mediator = mediator;
        }

        public async Task<Unit> Handle(SyncCervicalCancerScreening request, CancellationToken cancellationToken)
        {
            try
            {
                // await _stageRepository.ClearSite(request.CervicalCancerScreeningSourceBag.FacilityId.Value, request.CervicalCancerScreeningSourceBag.ManifestId.Value);

                var extracts =
                    _mapper.Map<List<StageCervicalCancerScreeningExtract>>(request.CervicalCancerScreeningSourceBag
                        .Extracts);
                if (request.CervicalCancerScreeningSourceBag.EmrSetup == EmrSetup.SingleFacility)
                {
                    if (request.CervicalCancerScreeningSourceBag.FacilityId.IsNullOrEmpty())
                    {
                        var facs = _facilityRepository.ReadFacilityCache();
                        request.CervicalCancerScreeningSourceBag.SetFacility(facs);
                    }

                    if (extracts.Any()) extracts.ForEach(x => x.Standardize(request.CervicalCancerScreeningSourceBag));
                }
                else
                {
                    var facs = _facilityRepository.ReadFacilityCache();
                    if (extracts.Any())
                        extracts.ForEach(x => x.Standardize(request.CervicalCancerScreeningSourceBag, facs));
                }

                await _stageRepository.SyncStage(extracts, request.CervicalCancerScreeningSourceBag.ManifestId.Value);

                var facIds = extracts.Select(x => x.FacilityId).Distinct().ToList();
                await _mediator.Publish(new SyncExtractEvent(facIds), cancellationToken);
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
