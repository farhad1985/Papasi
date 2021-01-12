part of 'set_password_bloc.dart';

@immutable
abstract class SetPasswordState {}

class SetPasswordInitial extends SetPasswordState {}

class LoadingVerifyCode extends SetPasswordState {}

class HomeState extends SetPasswordState {}

class FailureVerifyCode extends SetPasswordState {
  final String err;

  FailureVerifyCode({this.err});
}
