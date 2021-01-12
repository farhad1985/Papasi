import 'package:flutter/material.dart';
import 'package:papasi/domain/model/response/city/city.dart';

import '../../constant.dart';

class CityItem extends StatelessWidget {
  final City city;
  final ValueChanged<City> onPress;

  const CityItem({Key key, @required this.city, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      splashColor: kGreenD6F6F5,
      colorBrightness: Brightness.dark,
      highlightElevation: 0,
      elevation: 0,
      onPressed: () => onPress(city),
      child: Container(
        alignment: Alignment.centerLeft,
        color: Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          city.name ?? "",
          style: textStyleHeader,
        ),
      ),
    );
  }
}
