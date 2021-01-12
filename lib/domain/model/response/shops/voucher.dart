class Voucher {
  final String id;
  final String name;
  final String description;
  final int price;
  final int startDate;
  final int endDate;
  final String typeName;
  final String voucherType;
  final String currency;
  final int dscountPercent;
  final int discountAmount;
  final bool isGain;
  final bool isRedeem;
  final String imageUrl;

  Voucher({
    this.id,
    this.name,
    this.description,
    this.price,
    this.startDate,
    this.endDate,
    this.typeName,
    this.voucherType,
    this.currency,
    this.dscountPercent,
    this.discountAmount,
    this.isGain,
    this.isRedeem,
    this.imageUrl,
  });

  factory Voucher.fromJSON(Map<String, dynamic> map) {
    return Voucher(
      id: map['_id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      typeName: map['typeName'],
      voucherType: map['voucherType'],
      currency: map['currency'],
      isGain: map['isGain'],
      isRedeem: map['isRedeem'],
      imageUrl: map['imageUrl'],
      discountAmount: map['discountAmount'],
      dscountPercent: map['dscountPercent'],
    );
  }
}
