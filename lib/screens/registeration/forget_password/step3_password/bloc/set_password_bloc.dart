import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/registeration/registeration.dart';
import 'package:papasi/domain/usecase/api/registeration.dart';

part 'set_password_event.dart';
part 'set_password_state.dart';

class SetPasswordBloc extends Bloc<SetPasswordEvent, SetPasswordState> {
  SetPasswordBloc() : super(SetPasswordInitial());

  IRegisteration registerService = RegisterationService();

  @override
  Stream<SetPasswordState> mapEventToState(
    SetPasswordEvent event,
  ) async* {
    if (event is VerifyCode) {
      yield LoadingVerifyCode();
      try {
        await _setNewPassword(event.code, event.email, event.password);
        yield HomeState();
      } catch (e) {
        yield FailureVerifyCode(err: "error");
      }
    }
  }

  Future<bool> _setNewPassword(
      String code, String email, String password) async {
    return registerService.setNewPassword(
      code: code,
      email: email,
      password: password,
    );
  }
}
