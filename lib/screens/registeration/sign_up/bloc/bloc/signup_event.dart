part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class Register extends SignupEvent {
  final String nickname;
  final String email;
  final String password;

  Register(this.nickname, this.email, this.password);
}
