import 'package:flutter/material.dart';
import 'package:papasi/screens/components/consum_type.dart';
import 'package:papasi/screens/constant.dart';

class TransactionPrice extends StatelessWidget {
  final String price;

  const TransactionPrice({
    this.price,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('AMOUNT PAYMENT', style: TextStyle(color: kGrey)),
            ConsumType()
          ],
        ),
        Text('${price ?? 0} \$', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
