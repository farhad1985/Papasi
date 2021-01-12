import 'package:flutter/material.dart';

import '../../../constant.dart';

class TermOfServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "By siginig up, you agree to  Papasi’s ",
          style: TextStyle(
            color: kGrey,
            fontSize: 9,
          ),
          children: <TextSpan>[
            TextSpan(
                text: "Terms and Conditions",
                style: TextStyle(
                  color: kPrimery,
                  fontSize: 9,
                )),
          ],
        ),
      ),
    );
  }
}
