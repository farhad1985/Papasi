import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/registeration/registeration.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial());

  IRegisteration serviceRegisteration = RegisterationService();

  @override
  Stream<ForgetPasswordState> mapEventToState(
    ForgetPasswordEvent event,
  ) async* {
    if (event is ResetPasswordEvent) {
      yield LoadingForgetPassword();
      final result = await resetPassword(email: event.email);

      if (result) {
        yield SuccessForgetPassword();
      } else {
        yield FailureForgetPassword();
      }
    }
  }

  Future<bool> resetPassword({String email}) async {
    return serviceRegisteration.resetPassword(email: email);
  }
}
