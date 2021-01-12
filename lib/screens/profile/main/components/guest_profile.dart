import 'package:flutter/material.dart';
import 'package:papasi/screens/components/custom_button.dart';

import 'package:papasi/screens/constant.dart';

class GuestProfileCard extends StatelessWidget {
  final Function onPress;

  const GuestProfileCard({
    Key key,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                _buildAvatar(),
                SizedBox(width: 24),
                _buildJoinNow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildJoinNow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Get ready to get Papasi",
          style: TextStyle(
            fontSize: 15,
            color: kTextColor,
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: 150,
          height: 30,
          child: CustomButton(
            textColor: Colors.white,
            color: kPrimery,
            text: "join now".toUpperCase(),
            onPressed: onPress,
            borderColor: kPrimery,
          ),
        )
      ],
    );
  }

  Image _buildAvatar() {
    return Image.asset(
      "assets/icons/avatar.png",
      width: 70,
      height: 70,
      fit: BoxFit.fill,
    );
  }
}
