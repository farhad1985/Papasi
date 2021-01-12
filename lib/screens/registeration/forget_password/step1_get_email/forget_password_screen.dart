import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/screens/components/loading.dart';
import 'package:papasi/screens/components/rounded_button.dart';
import 'package:papasi/screens/registeration/forget_password/step1_get_email/bloc/forget_password_bloc.dart';
import 'package:papasi/screens/registeration/forget_password/step2_verify_email/foget_verify_code_screen.dart';

import '../../../constant.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgetPasswordScreen();
}

class _ForgetPasswordScreen extends State<ForgetPasswordScreen> {
  final _bloc = ForgetPasswordBloc();
  var email = "";

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTitleWelcome(),
            SizedBox(height: 16),
            _buildEmailID(),
            SizedBox(height: 32),
            BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
              listener: (context, state) {
                if (state is SuccessForgetPassword) {
                  _gotoForgetPasswordVerify(context);
                } else if (state is FailureForgetPassword) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(state.err),
                  ));
                }
              },
              cubit: _bloc,
              child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
                builder: (context, state) {
                  if (state is LoadingForgetPassword) {
                    return LoadingWidget();
                  }
                  return _buildLoginButton(context);
                },
                cubit: _bloc,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //------- Interface -------//
  Widget _buildEmailID() {
    return Container(
      height: 55,
      child: TextField(
        onChanged: (value) => email = value,
        autocorrect: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: kBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: kPrimery),
          ),
          labelText: "Enter you email ID",
          labelStyle: TextStyle(fontSize: 12),
        ),
      ),
    );
  }

  Column _buildTitleWelcome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Forgot you password?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          "We will send an email to your registered email ID with instruction to reset you password.",
          style: TextStyle(
            fontSize: 12,
            height: 1.7,
          ),
        ),
      ],
    );
  }

  Center _buildLoginButton(BuildContext context) {
    return Center(
      child: RoundedButton(
        width: 250,
        title: "get email".toUpperCase(),
        color: kPrimery,
        textColor: Colors.white,
        onPressed: () => _bloc.add(ResetPasswordEvent(email: email)),
      ),
    );
  }

  void _gotoForgetPasswordVerify(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ForgetVerifyCodeScreen(
          email: email,
        ),
      ),
    );
  }
}
