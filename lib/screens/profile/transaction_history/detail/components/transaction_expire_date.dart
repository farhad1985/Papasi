import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class TransactionExpireDate extends StatelessWidget {
  final String date;

  const TransactionExpireDate({
    this.date,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('EXPIRE DATE', style: TextStyle(color: kGrey)),
        Text(date ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
