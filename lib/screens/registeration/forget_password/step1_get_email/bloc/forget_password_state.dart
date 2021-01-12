part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class LoadingForgetPassword extends ForgetPasswordState {}

class SuccessForgetPassword extends ForgetPasswordState {}

class FailureForgetPassword extends ForgetPasswordState {
  final String err;

  FailureForgetPassword({this.err});
}
