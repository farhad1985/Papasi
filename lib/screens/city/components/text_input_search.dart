import 'package:flutter/material.dart';

import '../../constant.dart';

class TextInputSearch extends StatelessWidget {
  final ValueChanged<String> value;

  const TextInputSearch({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 55,
        child: TextField(
          onChanged: value,
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
        labelText: "Enter a Location",
        labelStyle: TextStyle(fontSize: 12),
        suffixIcon: Icon(Icons.search));
  }
}
