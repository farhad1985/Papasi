import 'package:flutter/material.dart';

import '../../../constant.dart';

class TextInputPassword extends StatelessWidget {
  final ValueChanged<String> value;

  const TextInputPassword({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 55,
        child: TextField(
          onChanged: value,
          obscureText: true,
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
      labelText: "Password",
      labelStyle: TextStyle(fontSize: 12),
      suffix: Icon(
        Icons.remove_red_eye,
        color: kGrey,
      ),
    );
  }
}
