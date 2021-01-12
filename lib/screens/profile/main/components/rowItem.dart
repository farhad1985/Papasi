import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class RowItem extends StatelessWidget {
  final String title;
  final Function onTap;

  const RowItem({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(Object context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(color: kTextColor, fontSize: 14),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
