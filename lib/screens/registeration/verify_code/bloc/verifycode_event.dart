part of 'verifycode_bloc.dart';

@immutable
abstract class VerifycodeEvent {}

class VerifyCode extends VerifycodeEvent {
  final String token;
  final String email;
  final String password;

  VerifyCode({this.token, this.email, this.password});
}
