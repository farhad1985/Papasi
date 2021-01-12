import '../../models.dart';

class LoginResult {
  final String token;
  final User user;

  LoginResult({this.token, this.user});

  factory LoginResult.fromJSON(Map<String, dynamic> map) {
    return LoginResult(
      token: map["token"],
      user: User.fromJSON(
        map["user"],
      ),
    );
  }
}
