class RegisterationMutation {
  static String loginOTPStep1() {
    return '''
        mutation Register(\$firstName: String!, \$email: String!, \$password: String!) {
          register(input: {
            firstName: \$firstName,
            email: \$email,
            password: \$password
          }) {
            enabled,
            email,
            username
          }
        }
        ''';
  }

  static String verifyCode = '''
        mutation (\$token: String!, \$password: String!, \$email: String!) {
          verifyEmailWithTokenAndLogin(
            token: \$token, 
            password: \$password,
            email: \$email
          ) {
            user {
              firstName,
              email,
              isGuest,
              balance,
              papasi
          },
            token,
          }
        }
  ''';

  static String resetPassword = '''
        mutation (\$code: String!, \$password: String!, \$email: String!) {
          resetPassword(
            code: \$code, 
            password: \$password,
            email: \$email
          )
        }
  ''';
}
