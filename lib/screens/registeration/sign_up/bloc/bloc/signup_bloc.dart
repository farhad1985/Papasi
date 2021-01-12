import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/registeration/registeration.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial());

  IRegisteration registerService = RegisterationService();

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is Register) {
      yield LoadingRegisteration();
      try {
        await _register(event.nickname, event.email, event.password);
        yield SuccessRegisteration();
      } catch (e) {
        yield FailureRegisteration(err: "error");
      }
    }
  }

  Future<LoginOTPStep1> _register(
      String nickname, String email, String password) async {
    return registerService.loginOTPStep1(nickname, email, password);
  }
}
