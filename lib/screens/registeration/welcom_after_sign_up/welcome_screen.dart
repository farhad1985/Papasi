import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/components/custom_button.dart';

import '../../constant.dart';

class WelcomeScreen extends StatelessWidget {
  final User user;

  const WelcomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 16),
          child: Column(
            children: [
              _buildTitle(),
              _buildBackgroundImage(),
              _buildSelectionButtons(context)
            ],
          ),
        ),
      );

  Widget _buildSelectionButtons(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: 160,
      color: kGreenD6F6F5,
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Container(
            width: 264,
            height: 40,
            child: CustomButton(
                borderColor: kPrimery,
                color: kPrimery,
                textColor: Colors.white,
                text: "let’s get started".toUpperCase(),
                onPressed: () => _gotoSignIn(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      "assets/images/welcome_login.png",
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hi ${user.firstname}",
            style: TextStyle(
              color: kTextColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "It’s good to have you here...",
            style: TextStyle(color: kTextColor, fontSize: 12, height: 2),
          ),
        ],
      ),
    );
  }

  void _gotoSignIn(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
