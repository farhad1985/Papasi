import 'package:flutter/material.dart';
import 'package:papasi/domain/model/response/transaction_history/voucher_type.dart';
import 'package:papasi/screens/constant.dart';

class ButtonCheckedVoucher extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoucherType voucherType;
  final ValueChanged<VoucherType> onPress;

  const ButtonCheckedVoucher({
    Key key,
    this.title,
    this.isSelected,
    this.voucherType,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(voucherType),
      child: Container(
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          title ?? '',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        decoration: BoxDecoration(
          color: isSelected ? kPrimery.withOpacity(0.2) : kGreyLight,
          border: Border.all(color: isSelected ? kPrimery : kGreyLight),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
