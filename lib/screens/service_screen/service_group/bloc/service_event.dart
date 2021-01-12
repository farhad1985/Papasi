part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent {}

class FetchSLAService extends ServiceEvent {}

class SelectSLAServiceItem extends ServiceEvent {
  final ServiceGroup serviceGroup;

  SelectSLAServiceItem({this.serviceGroup});
}
