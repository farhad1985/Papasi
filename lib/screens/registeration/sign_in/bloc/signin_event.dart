part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SignInButton extends SigninEvent {
  final String email;
  final String password;

  SignInButton({this.email, this.password});
}
