import 'package:flutter/material.dart';

import '../../../constant.dart';

class TitleVerifyCode extends StatelessWidget {
  final ValueChanged<String> valueChange;

  const TitleVerifyCode({Key key, this.valueChange}) : super(key: key);

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
            labelText: "Verify Code",
            labelStyle: TextStyle(fontSize: 12),
          ),
          onChanged: valueChange,
        ),
      );
}
