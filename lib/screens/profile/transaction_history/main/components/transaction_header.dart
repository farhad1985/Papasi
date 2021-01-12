import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class TransactionHeader extends StatelessWidget {
  final String title;
  final String typeName;
  final String voucherType;

  const TransactionHeader({
    Key key,
    this.title,
    this.typeName,
    this.voucherType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        SizedBox(height: 8),
        Text("$typeName | $voucherType",
            style: TextStyle(color: kGrey, fontSize: 12)),
      ],
    );
  }
}
