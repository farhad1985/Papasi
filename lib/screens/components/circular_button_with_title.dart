import 'package:flutter/material.dart';

import '../constant.dart';
import 'circular_button.dart';

class CircularButtonWithTitle extends StatelessWidget {
  final String title;
  final Image image;
  final Function onPressed;

  const CircularButtonWithTitle({
    Key key,
    this.title,
    this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircularButton(
          image: image,
          onPressed: onPressed,
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(color: kGrey, fontSize: 12),
        ),
      ],
    );
  }
}
