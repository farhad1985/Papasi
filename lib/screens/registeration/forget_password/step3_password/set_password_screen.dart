import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/screens/components/rounded_button.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/registeration/components/description_sign_in.dart';

import 'bloc/set_password_bloc.dart';
import 'components/title_verify.dart';

class SetPasswordScreen extends StatefulWidget {
  final String email;
  final String code;

  const SetPasswordScreen({Key key, this.email, this.code}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SetPasswordScreen(email, code);
}

class _SetPasswordScreen extends State<SetPasswordScreen> {
  final _bloc = SetPasswordBloc();
  final String email;
  final String code;

  String password = "";

  _SetPasswordScreen(this.email, this.code);

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
                    title: "Enter your new password",
                    description: "New password must be at least 8 character"),
                SizedBox(height: 24),
                TitleVerifyCode(valueChange: (value) => password = value),
                SizedBox(height: 32),
                BlocListener<SetPasswordBloc, SetPasswordState>(
                  listener: (context, state) {
                    if (state is FailureVerifyCode) {
                      return Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("sdf"),
                        ),
                      );
                    } else if (state is HomeState) {
                      _verifyCode(context: context);
                    }
                  },
                  cubit: _bloc,
                  child: BlocBuilder<SetPasswordBloc, SetPasswordState>(
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
            _bloc.add(VerifyCode(code: code, email: email, password: password));
          }),
    );
  }

  void _verifyCode({BuildContext context}) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
