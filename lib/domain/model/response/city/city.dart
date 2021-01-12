class City {
  final String id;
  final String name;
  final double lat;
  final double lng;

  City({this.id = "", this.name = "", this.lat = 0, this.lng = 0});

  factory City.fromJSON(Map<String, dynamic> map) {
    return City(id: map['_id'], name: map['name']);
  }
}
