import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class Precenter extends StatelessWidget {
  final int precent;

  const Precenter({
    Key key,
    this.precent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: kRed,
      ),
      child: Text(
        "${precent ?? 0} %",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
