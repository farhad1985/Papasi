import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class TransactionDate extends StatelessWidget {
  final String date;
  final String time;

  const TransactionDate({
    this.date,
    this.time,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('DATE', style: TextStyle(color: kGrey)),
              Text(date ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Time', style: TextStyle(color: kGrey)),
              Text(time ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
