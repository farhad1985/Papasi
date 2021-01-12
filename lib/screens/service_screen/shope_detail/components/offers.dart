import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';

import 'tag.dart';

class OfferView extends StatelessWidget {
  final Voucher voucher;
  final ValueChanged<Voucher> onPress;

  const OfferView({
    Key key,
    this.voucher,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 8,
      height: 110,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: () => onPress(voucher),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        voucher.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                ),
                SizedBox(height: 8),
                Tag(
                  title: voucher.typeName,
                  isRedeem: voucher.isRedeem,
                  isGain: voucher.isGain,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
