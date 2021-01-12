import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class TransactionTag extends StatelessWidget {
  const TransactionTag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 120,
      decoration: BoxDecoration(
          color: kGreenLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          )),
    );
  }
}
