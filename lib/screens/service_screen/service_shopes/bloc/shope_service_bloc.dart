import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/service%20group/service_group.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

part 'shope_service_event.dart';
part 'shope_service_state.dart';

class ShopeServiceBloc extends Bloc<ShopeServiceEvent, ShopeServiceState> {
  IServiceGroup _serviceGroup = ServiceGroupService();

  ShopeServiceBloc(ShopeServiceState initialState) : super(initialState);

  @override
  Stream<ShopeServiceState> mapEventToState(
    ShopeServiceEvent event,
  ) async* {
    if (event is FetchShopeDetail) {
      // yield LoadingDialogProgress();

      try {
        final result = await _fetchShopDetail(id: event.id);
        yield SuccessShopeService(shopeDetail: result);
      } catch (e) {
        yield FailureShopeService(err: e.toString());
      }
    }
  }

  Future<ShopeDetail> _fetchShopDetail({String id}) async {
    return _serviceGroup.fetchShopDetail(id: id);
  }
}
