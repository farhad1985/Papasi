import 'package:flutter/material.dart';

import '../constant.dart';

class ConsumType extends StatelessWidget {
  const ConsumType({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Reedem',
        style: TextStyle(color: Colors.black),
      ),
      height: 30,
      decoration: BoxDecoration(
          color: kRedeem, borderRadius: BorderRadius.circular(15)),
    );
  }
}
