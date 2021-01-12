import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/constant.dart';

class VoucherTypeFilter extends StatelessWidget {
  final VoucherType voucherType;
  final ValueChanged<VoucherType> onPress;

  const VoucherTypeFilter({
    Key key,
    this.voucherType,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilterChip(
          label: Text('Cash Back'),
          onSelected: (value) => onPress(VoucherType.cachback),
          selected: voucherType == VoucherType.cachback,
          selectedColor: kPrimery,
        ),
        SizedBox(width: 8),
        FilterChip(
          label: Text('Redeem'),
          onSelected: (value) => onPress(VoucherType.redeem),
          selected: voucherType == VoucherType.redeem,
          selectedColor: kPrimery,
        ),
      ],
    );
  }
}
