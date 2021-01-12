class User {
  final String firstname;
  final String email;
  final bool isGuest;
  final int balance;
  final int papasi;

  User({this.firstname, this.email, this.isGuest, this.balance, this.papasi});

  factory User.fromJSON(Map<String, dynamic> map) {
    return User(
      firstname: map['firstName'],
      email: map['email'],
      isGuest: map['isGuest'],
      balance: map['balance'],
      papasi: map['papasi'],
    );
  }
}
