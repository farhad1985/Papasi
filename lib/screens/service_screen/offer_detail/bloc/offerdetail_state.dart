part of 'offerdetail_bloc.dart';

@immutable
abstract class OfferdetailState {}

class OfferdetailInitial extends OfferdetailState {}

class LoadingOfferDetail extends OfferdetailState {}

class SelectVoucherType extends OfferdetailState {}

class ShowDialogConfirm extends OfferdetailState {
  final bool isRedeem;
  final String voucherId;

  ShowDialogConfirm({this.isRedeem, this.voucherId});
}

class SuccessOffer extends OfferdetailState {
  final String qrCode;
  final bool isRedeem;

  SuccessOffer({this.qrCode, this.isRedeem});
}

class FailureOffer extends OfferdetailState {
  final String err;

  FailureOffer({this.err});
}
