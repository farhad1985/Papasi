part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPasswordEvent {}

class ResetPasswordEvent extends ForgetPasswordEvent {
  final String email;

  ResetPasswordEvent({this.email});
}
