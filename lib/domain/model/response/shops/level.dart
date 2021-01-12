class Level {
  final String name;
  final int order;
  final int discountPercent;
  final int discountAmount;

  Level({
    this.name,
    this.order,
    this.discountPercent,
    this.discountAmount,
  });

  factory Level.fromJSON(Map<String, dynamic> map) {
    return Level(
      name: map['name'],
      order: map['order'],
      discountAmount: map['discountAmount'],
      discountPercent: map['discountPercent'],
    );
  }
}
