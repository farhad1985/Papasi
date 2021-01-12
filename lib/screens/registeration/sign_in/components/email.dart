import 'package:flutter/material.dart';

import '../../../constant.dart';

class TextInputEmail extends StatelessWidget {
  final ValueChanged<String> value;

  const TextInputEmail({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 55,
        child: TextField(
          onChanged: value,
          autocorrect: false,
          decoration: _buildInputDecoration(),
        ),
      );

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
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
    );
  }
}
