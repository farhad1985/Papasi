import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/service%20group/service_group.dart';
import 'package:papasi/data/core/location_manager.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  IServiceGroup service = ServiceGroupService();

  final _locationManager = LocationManager.instane();
  List<ServiceGroup> dataSource;

  ServiceBloc(ServiceState initialState) : super(initialState);

  @override
  Stream<ServiceState> mapEventToState(ServiceEvent event) async* {
    if (event is FetchSLAService) {
      yield LoadingServiceGroup();

      try {
        dataSource = await _fetchListSLAServiceGroup();
        yield ShowServiceGroup(serviceGroup: dataSource);
      } catch (e) {
        yield FailureServiceGroupState(err: e.toString());
      }
    } else if (event is SelectSLAServiceItem) {
      yield LoadingDialog();

      final result =
          await _fetchShopsService(serviceGroupId: event.serviceGroup.id);
      if (result.length > 0) {
        yield GotoShopList(shops: result, title: event.serviceGroup.name);
      } else {
        yield HideDialog();
      }
    }
  }

  Future<List<ServiceGroup>> _fetchListSLAServiceGroup() async {
    return service.fetchServiceGroups();
  }

  Future<List<Shope>> _fetchShopsService({String serviceGroupId}) async {
    final city = await _locationManager.getCity();
    final result = await service.fetchShopsService(
      serviceGroupId: serviceGroupId,
      city: city,
    );
    return result;
  }

  Future<City> getCity() async {
    final city = await LocationManager.instane().getCity();
    return city;
  }
}
