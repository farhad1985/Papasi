import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';

import 'voucher_type_filter.dart';

class ColumnFilter extends StatelessWidget {
  final String title;
  final ValueChanged<VoucherType> onPress;
  final VoucherType voucherType;

  const ColumnFilter({
    Key key,
    this.title,
    this.onPress,
    this.voucherType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title ?? '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          VoucherTypeFilter(voucherType: voucherType, onPress: onPress)
        ],
      ),
    );
  }
}
