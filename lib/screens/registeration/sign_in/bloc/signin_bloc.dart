import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/registeration/registeration.dart';
import 'package:papasi/data/sql/profileDAL.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial());

  IRegisteration registerationService = RegisterationService();

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is SignInButton) {
      yield LoadingSignin();
      try {
        final result = await _signin(
          email: event.email,
          password: event.password,
        );

        final profile = Profile(
          token: result.token,
          isGuest: false,
        );

        ProfileDAL.shared().save(profile: profile);

        yield SuccessSignin(user: result.user);
      } catch (e) {
        yield FailureSignin(err: "error");
      }
    }
  }

  Future<LoginResult> _signin({String email, String password}) async {
    return registerationService.singin(email: email, password: password);
  }
}
