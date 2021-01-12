import 'package:flutter/material.dart';
import 'package:papasi/screens/components/custom_button.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/registeration/sign_in/sign_in_screen.dart';
import 'package:papasi/screens/registeration/sign_up/sign_up_screen.dart';

class JoinAccountScreen extends StatelessWidget {
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
              _buildSelectionButtons(context),
            ],
          ),
        ),
      );

  Widget _buildSelectionButtons(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      // height: 200,
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
                text: "JOIN NOW",
                onPressed: () => _gotoSignIn(context)),
          ),
          SizedBox(height: 16),
          Container(
            width: 264,
            height: 40,
            child: CustomButton(
              borderColor: kPrimery,
              color: Colors.white,
              textColor: kPrimery,
              text: "I alredy have an account",
              onPressed: () => _gotoSignUP(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      "assets/images/join_back.png",
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
            "Your discount journey",
            style: TextStyle(
              color: kTextColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "starts here!",
            style: TextStyle(
              color: kTextColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _gotoSignIn(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignInScreen(),
    ));
  }

  void _gotoSignUP(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    ));
  }
}
