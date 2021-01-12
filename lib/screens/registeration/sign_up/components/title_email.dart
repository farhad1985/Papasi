import 'package:flutter/material.dart';

import '../../../constant.dart';

class TitleEmail extends StatelessWidget {
  final ValueChanged<String> email;

  const TitleEmail({Key key, this.email}) : super(key: key);

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
            labelText: "Email ID",
            labelStyle: TextStyle(fontSize: 12),
          ),
          onChanged: email,
        ),
      );
}
