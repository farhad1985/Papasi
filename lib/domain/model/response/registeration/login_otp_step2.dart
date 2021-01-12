import '../../models.dart';

class LoginOTPStep2 {
  String token;
  User user;

  LoginOTPStep2({
    this.token,
    this.user,
  });

  factory LoginOTPStep2.fromJSON(Map<String, dynamic> map) {
    return LoginOTPStep2(
      token: map['token'],
      user: User.fromJSON(map['user']),
    );
  }
}
