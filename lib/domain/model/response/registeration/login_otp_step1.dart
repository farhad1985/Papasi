class LoginOTPStep1 {
  String username;
  String email;
  bool enabled;

  LoginOTPStep1({this.username, this.email, this.enabled});

  factory LoginOTPStep1.fromJSON(Map<String, dynamic> map) {
    return LoginOTPStep1(
      username: map['username'],
      email: map['email'],
      enabled: map['enabled'],
    );
  }
}
