class Shope {
  final String id;
  final String name;
  final String estimatedDistance;
  final int myRate;
  final int totalReviews;
  final String description;
  final String address;
  final int openTo;
  final bool isEnable;
  final double lat;
  final double long;

  Shope({
    this.id,
    this.name,
    this.estimatedDistance,
    this.myRate,
    this.totalReviews,
    this.description,
    this.address,
    this.openTo,
    this.isEnable,
    this.lat,
    this.long,
  });

  factory Shope.fromJSON(Map<String, dynamic> map) {
    return Shope(
      id: map['_id'],
      name: map['name'],
      estimatedDistance: map['estimatedDistance'],
      myRate: map['myRate'],
      totalReviews: map['totalReviews'],
      description: map['description'],
      address: map['address'],
      openTo: map['openTo'],
      isEnable: map['isEnable'],
      lat: map['lat'],
      long: map['long'],
    );
  }
}
