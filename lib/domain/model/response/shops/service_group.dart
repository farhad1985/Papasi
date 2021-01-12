class ServiceGroup {
  final String id;
  final String name;
  final String icon;
  final int totalServices;
  final String desc;

  ServiceGroup({this.id, this.name, this.icon, this.totalServices, this.desc});

  factory ServiceGroup.fromJSON(Map<String, dynamic> map) {
    return ServiceGroup(
      id: map['_id'],
      name: map['name'],
      icon: map['iconURL'],
      totalServices: map['totalServices'],
      desc: map['description'],
    );
  }
}
