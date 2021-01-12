import 'package:flutter/material.dart';
import 'package:papasi/screens/components/rounded_button.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/registeration/components/description_sign_in.dart';
import 'package:papasi/screens/registeration/forget_password/step3_password/set_password_screen.dart';

import 'components/title_verify.dart';

class ForgetVerifyCodeScreen extends StatefulWidget {
  final String email;

  ForgetVerifyCodeScreen({this.email});

  @override
  _ForgetVerifyCodeScreenState createState() => _ForgetVerifyCodeScreenState();
}

class _ForgetVerifyCodeScreenState extends State<ForgetVerifyCodeScreen> {
  var code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: <Widget>[
                SizedBox(height: 38),
                SizedBox(height: 38),
                DescriptionSignIn(
                    title: "Verification Code",
                    description:
                        "Enter your OTP security code that we send to the"),
                SizedBox(height: 24),
                TitleVerifyCode(valueChange: (value) => code = value),
                SizedBox(height: 32),
                _buildJoinButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center _buildJoinButton(BuildContext context) {
    return Center(
      child: RoundedButton(
        width: 250,
        title: "Verify".toUpperCase(),
        color: kPrimery,
        textColor: Colors.white,
        onPressed: () => _verifyCode(context: context),
      ),
    );
  }

  void _verifyCode({BuildContext context}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SetPasswordScreen(
          email: widget.email,
          code: code,
        ),
      ),
    );
  }
}
