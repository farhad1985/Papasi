import 'package:flutter/material.dart';
import 'package:papasi/domain/model/onboardingModel.dart';
import 'package:papasi/screens/constant.dart';

class PageScreen extends StatelessWidget {
  final OnboardingModel model;

  const PageScreen({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(model.image ?? "assets/images/onboarding.png"),
            flex: 3,
          ),
          Container(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    model.title ?? "",
                    style: textStyleHeader,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    model.desc ?? "",
                    style: textStyleTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
