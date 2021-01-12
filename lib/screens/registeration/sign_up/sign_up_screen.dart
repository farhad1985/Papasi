import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/screens/components/rounded_button.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/registeration/sign_up/bloc/bloc/signup_bloc.dart';
import 'package:papasi/screens/registeration/sign_up/components/title_password.dart';
import 'package:papasi/screens/registeration/verify_code/verify_code_screen.dart';

import 'components/term_of_services.dart';
import 'components/title_email.dart';
import 'components/title_nickname.dart';
import 'components/title_welcome.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _bloc = SignupBloc();

  var nickname = "";
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          controller: ScrollController(keepScrollOffset: true),
          child: _buildBody(context),
        ),
      );

//------- Interface builder --------//

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16),
          TitleWelcome(),
          SizedBox(height: 24),
          TitleNickName(valueChange: (value) => nickname = value),
          SizedBox(height: 24),
          TitleEmail(email: (value) => email = value),
          SizedBox(height: 24),
          TitlePassword(password: (value) => password = value),
          SizedBox(height: 24),
          TermOfServices(),
          SizedBox(height: 16),
          BlocListener<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is FailureRegisteration) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(state.err)));
              } else if (state is SuccessRegisteration) {
                _gotoVerify(context);
              }
            },
            cubit: _bloc,
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, SignupState state) {
                if (state is LoadingRegisteration) {
                  return Center(child: CircularProgressIndicator());
                }
                return _buildJoinButton(context);
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
    );
  }

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

  Center _buildJoinButton(BuildContext context) {
    return Center(
      child: RoundedButton(
          width: 250,
          title: "join now".toUpperCase(),
          color: kPrimery,
          textColor: Colors.white,
          onPressed: () {
            _bloc.add(Register(
              nickname,
              email,
              password,
            ));
          }),
    );
  }

  void _gotoVerify(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            VerifyCodeScreen(email: email, password: password),
      ),
    );
  }
}
