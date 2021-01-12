import 'package:flutter/material.dart';

import '../constant.dart';

class CircularButton extends StatelessWidget {
  final Image image;
  final Function onPressed;

  const CircularButton({
    Key key,
    this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 48,
        height: 48,
        child: RaisedButton(
          onPressed: onPressed,
          color: kGreyLight,
          splashColor: kPrimery,
          padding: EdgeInsets.all(8),
          child: image,
        ),
      ),
    );
  }
}
