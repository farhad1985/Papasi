part of 'service_bloc.dart';

@immutable
abstract class ServiceState {}

class ServiceInitial extends ServiceState {}

class LoadingServiceGroup extends ServiceState {}

class LoadingDialog extends ServiceState {}

class HideDialog extends ServiceState {}

class ShowServiceGroup extends ServiceState {
  final List<ServiceGroup> serviceGroup;

  ShowServiceGroup({this.serviceGroup});
}

class FailureServiceGroupState extends ServiceState {
  final String err;

  FailureServiceGroupState({this.err});
}

class GotoShopList extends ServiceState {
  final List<Shope> shops;
  final String title;

  GotoShopList({this.shops, this.title});
}
