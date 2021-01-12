import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/components/rounded_button.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/registeration/components/description_sign_in.dart';
import 'package:papasi/screens/registeration/welcom_after_sign_up/welcome_screen.dart';

import 'bloc/verifycode_bloc.dart';
import 'components/title_verify.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String email;
  final String password;

  const VerifyCodeScreen({Key key, this.email, this.password})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _VerifyCodeScreen(email, password);
}

class _VerifyCodeScreen extends State<VerifyCodeScreen> {
  final _bloc = VerifycodeBloc();
  var token = "";

  final String email;
  final String password;

  _VerifyCodeScreen(this.email, this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step 2',
          style: TextStyle(color: Colors.black),
        ),
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
                TitleVerifyCode(valueChange: (value) => token = value),
                SizedBox(height: 32),
                BlocListener<VerifycodeBloc, VerifycodeState>(
                  listener: (context, state) {
                    if (state is FailureVerifyCode) {
                      return Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("sdf"),
                        ),
                      );
                    } else if (state is HomeState) {
                      _verifyCode(context: context, user: state.user);
                    }
                  },
                  cubit: _bloc,
                  child: BlocBuilder<VerifycodeBloc, VerifycodeState>(
                    builder: (context, state) => _buildJoinButton(context),
                    cubit: _bloc,
                  ),
                )
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
          onPressed: () {
            _bloc.add(
                VerifyCode(token: token, email: email, password: password));
          }),
    );
  }

  void _verifyCode({BuildContext context, User user}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(user: user),
      ),
    );
  }
}
