part of 'verifycode_bloc.dart';

@immutable
abstract class VerifycodeState {}

class VerifycodeInitial extends VerifycodeState {}

class LoadingVerifyCode extends VerifycodeState {}

class HomeState extends VerifycodeState {
  final User user;

  HomeState({this.user});
}

class FailureVerifyCode extends VerifycodeState {
  final String err;

  FailureVerifyCode({this.err});
}
