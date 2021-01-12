part of 'city_bloc.dart';

@immutable
abstract class CityState {}

class CityInitial extends CityState {}

class LoadingCity extends CityState {}

class SuccessCity extends CityState {
  final List<City> city;

  SuccessCity({this.city});
}

class FailureCity extends CityState {
  final String err;

  FailureCity({this.err});
}

class GotoHomeScreen extends CityState {}
