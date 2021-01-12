import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: kPrimery,
        fontFamily: "Montserrat",
      ),
      home: SplashScreen(),
    );
  }
}
