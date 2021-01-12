import 'package:flutter/material.dart';

class TitleWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to Papasi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          Text(
            "Sign up so you can start your journey",
            style: TextStyle(
              fontSize: 12,
              height: 2,
            ),
          ),
        ],
      );
}
