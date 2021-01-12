import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/constant.dart';

class MoreOffer extends StatelessWidget {
  final Voucher voucher;
  final Function onPressMore;

  const MoreOffer({Key key, this.voucher, this.onPressMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 8,
      height: 110,
      child: InkWell(
        onTap: onPressMore,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/more.png',
                  width: 50,
                  height: 50,
                ),
                // SizedBox(height: 8),
                Text(
                  'View all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kGrey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
