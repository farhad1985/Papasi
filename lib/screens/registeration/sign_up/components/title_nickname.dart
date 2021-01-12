import 'package:flutter/material.dart';

import '../../../constant.dart';

class TitleNickName extends StatelessWidget {
  final ValueChanged<String> valueChange;

  const TitleNickName({Key key, this.valueChange}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 55,
        child: TextField(
          autocorrect: false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: kBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: kPrimery),
            ),
            labelText: "Name/nickname",
            labelStyle: TextStyle(fontSize: 12),
          ),
          onChanged: valueChange,
        ),
      );
}
