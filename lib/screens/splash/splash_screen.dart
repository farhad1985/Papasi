import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/home/home_screen.dart';
import 'package:papasi/screens/onboarding/onboarding_screen.dart';
import 'package:papasi/screens/splash/bloc/splash_bloc.dart';
import 'package:papasi/screens/splash/bloc/splash_event.dart';
import 'package:papasi/screens/splash/bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  final _bloc = SplashBloc(LoadingState());

  SplashScreen() {
    _bloc.add(FetchSetting());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimery,
      body: BlocProvider(
        create: (context) => SplashBloc(LoadingState()),
        child: BlocListener(
          cubit: _bloc,
          listener: (context, state) {
            if (state is HomeState) {
              _gotoHomeScreen(context);
            } else if (state is OnBoardingScreenState) {
              _gotoOnBoardingScreen(context);
            }
          },
          child: BlocBuilder(
            cubit: _bloc,
            builder: (context, state) {
              return _buildSplash();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSplash() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/splash.png"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pappasi",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "a loyalty app",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  void _gotoHomeScreen(BuildContext context) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  void _gotoOnBoardingScreen(BuildContext context) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OnBoardingScreen(),
        fullscreenDialog: true,
      ),
    );
  }
}
