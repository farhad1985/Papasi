class JoinVenture {
  final String firstName;

  JoinVenture({this.firstName});

  factory JoinVenture.fromJSON(Map<String, dynamic> map) {
    return JoinVenture(firstName: map['firstName']);
  }
}
