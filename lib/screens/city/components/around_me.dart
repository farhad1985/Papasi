import 'package:flutter/material.dart';
import 'package:papasi/screens/components/custom_button.dart';

import '../../constant.dart';

class AroundMe extends StatelessWidget {
  final Function onPress;

  const AroundMe({
    Key key,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        child: CustomButton(
          text: "around me".toUpperCase(),
          borderColor: kPrimery,
          color: kPrimery,
          textColor: Colors.white,
          onPressed: onPress,
        ),
      ),
    );
  }
}
