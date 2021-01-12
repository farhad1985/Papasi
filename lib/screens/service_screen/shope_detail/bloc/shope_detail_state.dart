part of 'shope_detail_bloc.dart';

@immutable
abstract class ShopeDetailState {}

class ShopeDetailInitial extends ShopeDetailState {}

class LoadingShopeDetail extends ShopeDetailState {}

class FailureShopeDetailState extends ShopeDetailState {
  final String err;

  FailureShopeDetailState({this.err});
}

class GotoMoreMoreDetail extends ShopeDetailState {
  final List<Voucher> offers;

  GotoMoreMoreDetail({this.offers});
}

class GotoOfferDetail extends ShopeDetailState {
  final Offer offer;

  GotoOfferDetail({this.offer});
}
