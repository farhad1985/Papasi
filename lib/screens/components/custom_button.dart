import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Color textColor;
  final String text;
  final Function onPressed;

  const CustomButton({
    Key key,
    this.color,
    this.borderColor,
    this.textColor,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      textColor: textColor,
      color: color,
      child: Text(
        text,
        style: TextStyle(fontSize: 17),
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: borderColor,
            width: 1,
          )),
    );
  }
}
