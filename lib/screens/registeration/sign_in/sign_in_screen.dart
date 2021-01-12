import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/components/rounded_button.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/registeration/forget_password/step1_get_email/forget_password_screen.dart';
import 'package:papasi/screens/registeration/sign_in/bloc/signin_bloc.dart';
import 'package:papasi/screens/registeration/welcom_after_sign_up/welcome_screen.dart';

import 'components/email.dart';
import 'components/password.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = "";
  String password = "";

  final _bloc = SigninBloc();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          controller: ScrollController(keepScrollOffset: true),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16),
                _buildTitleWelcome(),
                SizedBox(height: 24),
                TextInputEmail(value: (value) => email = value),
                SizedBox(height: 24),
                TextInputPassword(value: (value) => password = value),
                SizedBox(height: 8),
                _buildForgotPassword(),
                BlocListener<SigninBloc, SigninState>(
                  listener: (context, state) {
                    if (state is FailureSignin) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text(state.err)));
                    } else if (state is SuccessSignin) {
                      _gotoWelcomePage(context: context, user: state.user);
                    }
                  },
                  cubit: _bloc,
                  child: BlocBuilder<SigninBloc, SigninState>(
                    builder: (context, state) {
                      if (state is LoadingSignin) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return _buildLoginButton(context);
                    },
                    cubit: _bloc,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    "Or continue with",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(height: 16),
                _buildLoginByAnother(),
              ],
            ),
          ),
        ),
      );

//------- Interface builder --------//

  Row _buildLoginByAnother() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(child: Image.asset("assets/icons/google.png")),
        SizedBox(width: 28),
        InkWell(child: Image.asset("assets/icons/facebook.png")),
      ],
    );
  }

  Center _buildLoginButton(BuildContext context) {
    return Center(
      child: RoundedButton(
        width: 250,
        title: "login".toUpperCase(),
        color: kPrimery,
        textColor: Colors.white,
        onPressed: () {
          _bloc.add(SignInButton(email: email, password: password));
        },
      ),
    );
  }

  FlatButton _buildForgotPassword() {
    return FlatButton(
      onPressed: () => _gotoForgotPasswordPage(context: context),
      child: Text(
        "I forgot my password?",
        style: TextStyle(color: kPrimery, fontSize: 12),
      ),
    );
  }

  Column _buildTitleWelcome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back...",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          "Login tp continue on your journey",
          style: TextStyle(
            fontSize: 12,
            height: 2,
          ),
        ),
      ],
    );
  }

  void _gotoWelcomePage({BuildContext context, User user}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(user: user),
      ),
    );
  }

  void _gotoForgotPasswordPage({BuildContext context}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ForgetPasswordScreen(),
      ),
    );
  }
}
