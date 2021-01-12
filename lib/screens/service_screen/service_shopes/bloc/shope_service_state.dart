part of 'shope_service_bloc.dart';

@immutable
abstract class ShopeServiceState {}

class ShopeServiceInitial extends ShopeServiceState {}

class LoadingDialogProgress extends ShopeServiceState {}

class HideLoading extends ShopeServiceState {}

class SuccessShopeService extends ShopeServiceState {
  final ShopeDetail shopeDetail;

  SuccessShopeService({this.shopeDetail});
}

class FailureShopeService extends ShopeServiceState {
  final String err;

  FailureShopeService({this.err});
}
