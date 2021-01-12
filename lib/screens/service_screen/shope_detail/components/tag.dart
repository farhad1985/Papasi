import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tag extends StatefulWidget {
  final String title;
  bool isGain;
  bool isRedeem;

  Color color;
  Color txtColor;

  Tag({
    Key key,
    @required this.title,
    this.isGain,
    this.isRedeem,
  }) : super(key: key) {
    if (this.isGain == null) this.isGain = false;
    if (this.isRedeem == null) this.isRedeem = false;

    if (this.isGain && !this.isRedeem) {
      color = Color(0xFFE4F99D);
      txtColor = Color(0xFF588E07);
    } else if (!this.isGain && this.isRedeem) {
      color = Color(0xFFB4D8FF);
      txtColor = Color(0xFF224EB7);
    } else if (this.isGain && this.isRedeem) {
      color = Color(0xFFFFEF99);
      txtColor = Color(0xFFB78701);
    }
  }

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        widget.title,
        style: TextStyle(
          fontSize: 13,
          color: widget.txtColor,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: widget.color,
      ),
    );
  }
}
