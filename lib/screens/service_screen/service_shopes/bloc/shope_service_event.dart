part of 'shope_service_bloc.dart';

@immutable
abstract class ShopeServiceEvent {}

class FetchShopeDetail extends ShopeServiceEvent {
  final String id;

  FetchShopeDetail({this.id});
}
