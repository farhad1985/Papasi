import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class DescriptionSignIn extends StatelessWidget {
  final String title;
  final String description;

  const DescriptionSignIn({
    Key key,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: textStyleHeader,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: textStyleTitle,
          ),
        ],
      ),
    );
  }
}
