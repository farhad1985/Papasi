class RateSummary {
  final String name;
  final int rate;
  final int count;

  RateSummary({this.name, this.rate, this.count});

  factory RateSummary.fromJSON(Map<String, dynamic> map) {
    return RateSummary(
      name: map['map'],
      rate: map['rate'],
      count: map['count'],
    );
  }
}
