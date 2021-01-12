part of 'set_password_bloc.dart';

@immutable
abstract class SetPasswordEvent {}

class VerifyCode extends SetPasswordEvent {
  final String code;
  final String email;
  final String password;

  VerifyCode({this.code, this.email, this.password});
}
