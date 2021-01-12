import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:papasi/domain/model/models.dart';

import 'brand_item_map.dart';

class ShopesOnMap extends StatelessWidget {
  final ValueChanged<String> onPress;
  final ValueChanged<LatLng> onPageChanged;

  const ShopesOnMap({
    Key key,
    @required PageController pageController,
    @required this.shops,
    this.onPress,
    this.onPageChanged,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final List<Shope> shops;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 75,
      bottom: 32,
      left: 0,
      right: 0,
      child: PageView.builder(
        onPageChanged: (value) => onPageChanged(_getLocation(value)),
        controller: _pageController,
        itemCount: shops.length,
        itemBuilder: (context, index) =>
            BrandItemMap(shop: shops[index], onPress: onPress),
      ),
    );
  }

  LatLng _getLocation(int index) {
    final shop = shops[index];
    return LatLng(shop.lat, shop.long);
  }
}
