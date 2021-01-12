part of 'offerdetail_bloc.dart';

@immutable
abstract class OfferdetailEvent {}

class GetVoucher extends OfferdetailEvent {
  final bool isRedeem;
  final bool isGain;
  final String voucherId;

  GetVoucher({this.isRedeem, this.isGain, this.voucherId});
}

class ShowConfirmDialog extends OfferdetailEvent {
  final bool isRedeem;
  final String voucherId;

  ShowConfirmDialog({this.isRedeem, this.voucherId});
}

class ConfirmGetVoucher extends OfferdetailEvent {
  final bool isRedeem;
  final String voucherId;

  ConfirmGetVoucher({this.isRedeem, this.voucherId});
}
