import 'package:papasi/domain/model/models.dart';

class Offer {
  final String id;
  final String name;
  final String description;
  final int price;
  final int startDate;
  final int endDate;
  final String typeName;
  final String offerType;
  final String currency;
  final int dscountPercent;
  final int discountAmount;
  final String imageUrl;
  final String consumePlace;
  final List<Level> levels;
  final int usageCount;
  bool isGain;
  bool isRedeem;

  Offer(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.startDate,
      this.endDate,
      this.typeName,
      this.offerType,
      this.currency,
      this.dscountPercent,
      this.discountAmount,
      this.isGain,
      this.isRedeem,
      this.imageUrl,
      this.levels,
      this.consumePlace,
      this.usageCount});

  factory Offer.fromJSON(Map<String, dynamic> map) {
    return Offer(
      id: map['_id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      typeName: map['typeName'],
      offerType: map['voucherType'],
      currency: map['currency'],
      isGain: map['isGain'] ?? false,
      isRedeem: map['isRedeem'] ?? false,
      imageUrl: map['imageUrl'],
      discountAmount: map['discountAmount'],
      dscountPercent: map['dscountPercent'],
      consumePlace: map['consumePlace'],
      usageCount: map['usageCount'],
      levels: List<Level>.from(map['details'].map((e) => Level.fromJSON(e))),
    );
  }

  ConsumePlace getConsumePlaceType() {
    switch (consumePlace) {
      case 'Online':
        return ConsumePlace.online;
      case 'InStore':
        return ConsumePlace.inStore;
      default:
        return ConsumePlace.online;
    }
  }

  String getConsumePlaceImageURL() {
    switch (consumePlace) {
      case 'Online':
        return 'assets/icons/offer_online.png';
      case 'InStore':
        return 'assets/icons/offer_in_store.png';
      default:
        return '';
    }
  }
}
