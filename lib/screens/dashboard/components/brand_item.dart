import 'package:flutter/material.dart';

import '../../constant.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      padding: EdgeInsets.only(top: 8, left: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset("assets/images/starbucks.png"),
              Container(
                child: Text(
                  "Espresseo & two donuts for 15\$",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Text(
                "18\$",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: kPrimery,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
