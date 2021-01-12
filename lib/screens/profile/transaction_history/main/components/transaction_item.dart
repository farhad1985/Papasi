import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/constant.dart';

import 'transaction_date.dart';
import 'transaction_header.dart';
import 'transaction_price.dart';
import 'transaction_tag.dart';
import 'package:papasi/data/core/papa_core.dart';

class TransactionItem extends StatelessWidget {
  final TransactionHistory item;
  final ValueChanged<TransactionHistory> onPress;

  const TransactionItem({
    Key key,
    this.item,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => onPress(item),
        child: Row(
          children: [
            TransactionTag(),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TransactionHeader(
                    title: item.voucher.name,
                    voucherType: item.voucher.voucherType,
                    typeName: item.voucher.typeName,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TransactionPrice(
                        price: item.voucher.price.toSeparate(),
                      ),
                      TransactionDate(
                        date: item.voucher.startDate.toDate(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 8),
            Container(
              color: kBorder,
              width: 1,
              height: 120,
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
