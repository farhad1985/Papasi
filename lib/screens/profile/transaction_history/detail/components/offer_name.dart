import 'package:flutter/material.dart';
import 'package:papasi/screens/components/voucher_type_view.dart';
import 'package:papasi/screens/constant.dart';

class TransactionOfferName extends StatelessWidget {
  final String title;

  const TransactionOfferName({
    this.title,
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
            Text('OFFER NAME', style: TextStyle(color: kGrey)),
            VoucherTypeView()
          ],
        ),
        Text(title ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
