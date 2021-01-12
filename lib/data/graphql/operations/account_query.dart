class AccountQuery {
  static var profile = """
    query {
      me {
        firstName,
        email,
        isGuest,
        balance,
        papasi
      }
  }
""";
}
