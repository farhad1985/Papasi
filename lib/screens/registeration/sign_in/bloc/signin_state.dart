part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class LoadingSignin extends SigninState {}

class SuccessSignin extends SigninState {
  final User user;

  SuccessSignin({this.user});
}

class FailureSignin extends SigninState {
  final String err;

  FailureSignin({this.err});
}
