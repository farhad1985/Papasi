import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/registeration/registeration.dart';
import 'package:papasi/data/sql/profileDAL.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/registeration.dart';

part 'verifycode_event.dart';
part 'verifycode_state.dart';

class VerifycodeBloc extends Bloc<VerifycodeEvent, VerifycodeState> {
  VerifycodeBloc() : super(VerifycodeInitial());

  IRegisteration registerService = RegisterationService();

  @override
  Stream<VerifycodeState> mapEventToState(
    VerifycodeEvent event,
  ) async* {
    if (event is VerifyCode) {
      yield LoadingVerifyCode();
      try {
        final result = await _verifyCode(
          event.token,
          event.email,
          event.password,
        );

        final profile = Profile(
          token: result.token,
          isGuest: true,
        );

        ProfileDAL.shared().save(profile: profile);

        yield HomeState(user: result.user);
      } catch (e) {
        yield FailureVerifyCode(err: "error");
      }
    }
  }

  Future<LoginOTPStep2> _verifyCode(
      String token, String email, String password) async {
    return registerService.loginOTPStep2(token, email, password);
  }
}
