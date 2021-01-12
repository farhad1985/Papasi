part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class CurrentLocationEvent extends MapEvent {}

class FetchShopeDetailMapEvent extends MapEvent {
  final String id;

  FetchShopeDetailMapEvent({this.id});
}
