import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:papasi/data/sql/CityDAL.dart';
import 'package:papasi/domain/model/response/city/city.dart';

class LocationManager {
  final _cityDAL = CityDAL();

  LocationManager._();

  factory LocationManager.instane() => LocationManager._();

  Future<City> getCity() async {
    final city = await _cityDAL.getCity();

    if (city.id != null) {
      return city;
    }

    final position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final currentCity = City(
        lat: position.latitude,
        lng: position.longitude,
        name: "Current Location");

    return currentCity;
  }

  void saveCity({City city}) {
    _cityDAL.saveCity(city: city);
  }

  Future aroundMe() async {
    _cityDAL.removeCity();
  }

  Future<LatLng> getCurrentLocation() async {
    final position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return LatLng(position.latitude, position.longitude);
  }
}
