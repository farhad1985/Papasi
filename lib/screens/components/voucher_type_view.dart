import 'package:flutter/material.dart';

import '../constant.dart';

class VoucherTypeView extends StatelessWidget {
  const VoucherTypeView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Online Store',
        style: TextStyle(color: kPrimery),
      ),
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kBorder),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
