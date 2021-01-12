part of 'shope_detail_bloc.dart';

@immutable
abstract class ShopeDetailEvent {}

class ViewAllOffers extends ShopeDetailEvent {
  final String id;

  ViewAllOffers({this.id});
}

class FetchOneOffer extends ShopeDetailEvent {
  final String id;

  FetchOneOffer({this.id});
}
