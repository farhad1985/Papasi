import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/city/city_service.dart';
import 'package:papasi/data/api/registeration/registeration.dart';
import 'package:papasi/data/core/location_manager.dart';
import 'package:papasi/data/sql/profileDAL.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/model/response/city/city.dart';
import 'package:papasi/domain/model/response/registeration/login.dart';
import 'package:papasi/domain/usecase/api/city.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityInitial());

  ICityService _cityService = CityService();
  IRegisteration _registerService = RegisterationService();

  final locationManager = LocationManager.instane();

  @override
  Stream<CityState> mapEventToState(
    CityEvent event,
  ) async* {
    if (event is SearchCityEvent) {
      yield LoadingCity();
      try {
        final result = await _fetchCityService(name: event.name);
        yield SuccessCity(city: result);
      } catch (e) {
        yield FailureCity(err: e);
      }
    } else if (event is SelectedCity) {
      locationManager.saveCity(city: event.city);
      final user = await _signInGuest(cityId: event.city.id);
      await _saveProfile(user.token);
      yield GotoHomeScreen();
    } else if (event is AroundMeCity) {
      await locationManager.aroundMe();
      try {
        final result = await locationManager.getCity();
        final user = await _signInGuest(lat: result.lat, long: result.lng);
        await _saveProfile(user.token);
        yield GotoHomeScreen();
      } catch (e) {
        yield FailureCity(err: "You don't have any access to location");
      }
    }
  }

  Future _saveProfile(String token) async {
    final profile = Profile(
      token: token,
      isGuest: true,
    );

    await ProfileDAL.shared().save(profile: profile);
  }

  Future<List<City>> _fetchCityService({String name}) async {
    return _cityService.fetchCity(name: name);
  }

  Future<LoginResult> _signInGuest(
      {double lat, double long, String cityId}) async {
    return _registerService.singinGuest(lat: lat, long: long, cityId: cityId);
  }
}
