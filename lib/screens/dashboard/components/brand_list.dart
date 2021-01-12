import 'package:flutter/material.dart';

import 'brand_item.dart';

class BrandList extends StatelessWidget {
  const BrandList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 16),
          child: Text(
            "Most popular",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 144,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              BrandItem(),
              BrandItem(),
              BrandItem(),
              BrandItem(),
              BrandItem(),
              BrandItem(),
            ],
          ),
        )
      ],
    );
  }
}
