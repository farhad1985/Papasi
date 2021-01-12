import 'package:flutter/material.dart';
import 'package:papasi/domain/model/response/city/city.dart';
import 'package:papasi/screens/city/components/city_item.dart';

class CityListView extends StatelessWidget {
  final List<City> cities;
  final ValueChanged<City> onPress;

  const CityListView({Key key, this.cities, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) => CityItem(
          city: cities[index],
          onPress: onPress,
        ),
      ),
    );
  }
}
