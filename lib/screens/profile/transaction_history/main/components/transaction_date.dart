import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class TransactionDate extends StatelessWidget {
  final String date;

  const TransactionDate({
    Key key,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: TextStyle(
            fontSize: 12,
            color: kGrey,
          ),
        ),
        Text(
          date ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
