import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/constant.dart';

import '../../../components/status_brand.dart';

class BrandItem extends StatelessWidget {
  final ValueChanged<String> onPress;
  final Shope shop;

  const BrandItem({
    Key key,
    this.onPress,
    this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(left: 12, right: 12, top: 16),
      child: InkWell(
        onTap: () => onPress(shop.id),
        splashColor: kGreenD6F6F5,
        highlightColor: kGreenD6F6F5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/images/starbucks.png",
                height: 48,
                width: 48,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      shop.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icons/distance.png"),
                        const SizedBox(width: 4),
                        Text(
                          shop.estimatedDistance.toString(),
                          style: TextStyle(color: kGrey, fontSize: 11),
                        ),
                        const SizedBox(width: 16),
                        Image.asset("assets/icons/star.png"),
                        const SizedBox(width: 4),
                        Text(
                          shop.myRate.toString(),
                          style: TextStyle(color: kGrey, fontSize: 11),
                        )
                      ],
                    ),
                  ],
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
