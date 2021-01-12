import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/components/status_brand.dart';
import 'package:papasi/screens/constant.dart';

class BrandItemMap extends StatelessWidget {
  final ValueChanged<String> onPress;
  final Shope shop;

  const BrandItemMap({
    Key key,
    this.onPress,
    this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () => onPress(shop.id),
        splashColor: kGreenD6F6F5,
        highlightColor: kGreenD6F6F5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/images/starbucks.png",
                height: 38,
                width: 38,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  shop.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              StatusBrand(isOpen: shop.isEnable)
            ],
          ),
        ),
      ),
    );
  }
}
