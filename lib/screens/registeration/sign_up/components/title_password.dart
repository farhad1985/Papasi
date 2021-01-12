import 'package:flutter/material.dart';

import '../../../constant.dart';

class TitlePassword extends StatelessWidget {
  final ValueChanged<String> password;

  const TitlePassword({Key key, this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 55,
        child: TextField(
          obscureText: true,
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
            labelText: "Password (min 8 characters)",
            labelStyle: TextStyle(fontSize: 12),
            suffix: Icon(
              Icons.remove_red_eye,
              color: kGrey,
            ),
          ),
          onChanged: password,
        ),
      );
}
