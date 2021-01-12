class RegisterationQuery {
  static var login = """
      query (\$email: String!, \$password: String!) {
        login(
          user: {
            email: \$email, 
            password: \$password,
          }) {
          token,
          user {
            username,
            firstName
          }
        }
      }
  """;

  static var resetPassword = """
    query (\$email: String!) {
    resetPasswordRequest(email: \$email) 
  }
  """;

  static var loginGuest = """
      query (\$uid: String!, \$lat: Float, \$long: Float, \$cityId: ID) {
          loginGuest(input: {
              uid: \$uid,
              lat: \$lat,
              long: \$long,
              cityId: \$cityId
          }){
            token
            user {
                _id
                cityId
                cityName
            }
          }
      }
  """;
}
