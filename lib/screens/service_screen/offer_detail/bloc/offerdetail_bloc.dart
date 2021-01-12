import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/service%20group/service_group.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

part 'offerdetail_event.dart';
part 'offerdetail_state.dart';

class OfferdetailBloc extends Bloc<OfferdetailEvent, OfferdetailState> {
  OfferdetailBloc() : super(OfferdetailInitial());

  IServiceGroup service = ServiceGroupService();

  @override
  Stream<OfferdetailState> mapEventToState(
    OfferdetailEvent event,
  ) async* {
    if (event is GetVoucher) {
      if (event.isGain && event.isRedeem) {
        yield SelectVoucherType();
      } else {
        yield ShowDialogConfirm(
            isRedeem: event.isRedeem, voucherId: event.voucherId);
      }
    } else if (event is ShowConfirmDialog) {
      yield ShowDialogConfirm(
          isRedeem: event.isRedeem, voucherId: event.voucherId);
    } else if (event is ConfirmGetVoucher) {
      yield LoadingOfferDetail();

      try {
        final result = await fetchQRVoucher(event.isRedeem, event.voucherId);
        yield SuccessOffer(qrCode: result, isRedeem: event.isRedeem);
      } catch (e) {
        yield FailureOffer(err: e.toString());
      }
    }
  }

  Future<String> fetchQRVoucher(bool isRedeem, String voucherId) {
    return service.fetchQRVoucher(isRedeem: isRedeem, voucherId: voucherId);
  }
}
