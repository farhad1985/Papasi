import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class PageCounter extends StatelessWidget {
  final int index;
  final count;

  const PageCounter({Key key, this.count, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 3; i++)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: i == index ? kPrimery : kBorder,
            ),
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: 24,
            height: 4,
          )
      ],
    );
  }
}
