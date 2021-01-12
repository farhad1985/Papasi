import 'package:papasi/domain/model/models.dart';

abstract class IRegisteration {
  Future<LoginOTPStep1> loginOTPStep1(
      String nickname, String email, String password);

  Future<LoginOTPStep2> loginOTPStep2(
      String token, String email, String password);

  Future<LoginResult> singin({String email, String password});

  Future<LoginResult> singinGuest({double lat, double long, String cityId});

  Future<bool> resetPassword({String email});

  Future<bool> setNewPassword({String code, String email, String password});
}
