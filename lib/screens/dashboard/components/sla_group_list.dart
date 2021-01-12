import 'package:flutter/material.dart';
import 'package:papasi/screens/dashboard/components/brand_sla.dart';

class SLAGroupList extends StatelessWidget {
  const SLAGroupList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 16, bottom: 8),
          child: Text(
            "Most popular",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              BrandSLA(),
              BrandSLA(),
              BrandSLA(),
              BrandSLA(),
              BrandSLA(),
            ],
          ),
        )
      ],
    );
  }
}
