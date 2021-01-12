import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class TransactionPrice extends StatelessWidget {
  final String price;

  const TransactionPrice({
    Key key,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$price\$',
          style: TextStyle(
            fontSize: 20,
            color: kGreenLight,
          ),
        ),
        SizedBox(width: 4),
        Image.asset('assets/icons/flag.png'),
      ],
    );
  }
}
