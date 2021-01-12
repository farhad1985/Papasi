import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color color;
  final Function onPressed;
  final double width;

  const RoundedButton(
      {Key key,
      this.title,
      this.textColor,
      this.color,
      this.onPressed,
      this.width = 140})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        color: color,
      ),
    );
  }
}
