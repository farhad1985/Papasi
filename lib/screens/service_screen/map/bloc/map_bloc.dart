import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/service%20group/service_group.dart';
import 'package:papasi/data/core/location_manager.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  IServiceGroup _serviceGroup = ServiceGroupService();

  MapBloc() : super(MapInitial());

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is CurrentLocationEvent) {
      final result = await _fetchCurrentLocation();
      yield CurrentLocationState(posision: result);
    } else if (event is FetchShopeDetailMapEvent) {
      yield LoadingState();

      try {
        final result = await _fetchShopDetail(id: event.id);
        yield SuccessState(shopeDetail: result);
      } catch (e) {
        yield FailureState(err: e.toString());
      }
    }
  }

  Future<LatLng> _fetchCurrentLocation() {
    return LocationManager.instane().getCurrentLocation();
  }

  Future<ShopeDetail> _fetchShopDetail({String id}) async {
    return _serviceGroup.fetchShopDetail(id: id);
  }
}
