import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class InputVerifyCode extends StatelessWidget {
  const InputVerifyCode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: "",
              ),
              maxLength: 1,
            ),
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: kPrimery,
                borderRadius: BorderRadius.circular(40),
              ),
            )
          ],
        ),
      ),
    );
  }
}
