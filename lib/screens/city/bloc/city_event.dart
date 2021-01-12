part of 'city_bloc.dart';

@immutable
abstract class CityEvent {}

class SearchCityEvent extends CityEvent {
  final String name;

  SearchCityEvent({this.name});
}

class SelectedCity extends CityEvent {
  final City city;

  SelectedCity({this.city});
}

class AroundMeCity extends CityEvent {}
