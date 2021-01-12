part of 'map_bloc.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class CurrentLocationState extends MapState {
  final LatLng posision;

  CurrentLocationState({this.posision});
}

class LoadingState extends MapState {}

class SuccessState extends MapState {
  final ShopeDetail shopeDetail;
  final Set<Marker> markers;

  SuccessState({
    this.shopeDetail,
    this.markers,
  });
}

class FailureState extends MapState {
  final String err;

  FailureState({this.err});
}
