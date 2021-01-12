import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/service%20group/service_group.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

part 'shope_detail_event.dart';
part 'shope_detail_state.dart';

class ShopeDetailBloc extends Bloc<ShopeDetailEvent, ShopeDetailState> {
  ShopeDetailBloc() : super(ShopeDetailInitial());

  IServiceGroup _serviceGroup = ServiceGroupService();

  @override
  Stream<ShopeDetailState> mapEventToState(
    ShopeDetailEvent event,
  ) async* {
    if (event is ViewAllOffers) {
      yield LoadingShopeDetail();

      try {
        final result = await _fetchAllOffers(event.id);
        yield GotoMoreMoreDetail(offers: result);
      } catch (e) {
        yield FailureShopeDetailState(err: e.toString());
      }
    } else if (event is FetchOneOffer) {
      yield LoadingShopeDetail();

      try {
        final result = await _fetchOnOffer(event.id);
        yield GotoOfferDetail(offer: result);
      } catch (e) {
        yield FailureShopeDetailState(err: e.toString());
      }
    }
  }

  Future<List<Voucher>> _fetchAllOffers(String id) {
    return _serviceGroup.fetchOffers(id: id);
  }

  Future<Offer> _fetchOnOffer(String id) {
    return _serviceGroup.fetchOneOffer(id: id);
  }
}
