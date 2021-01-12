part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class LoadingRegisteration extends SignupState {}

class SuccessRegisteration extends SignupState {}

class FailureRegisteration extends SignupState {
  final String err;

  FailureRegisteration({this.err});
}
