import 'package:flutter/material.dart';
import 'package:papasi/domain/model/onboardingModel.dart';
import 'package:papasi/screens/city/city_screen.dart';
import 'package:papasi/screens/components/custom_button.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/onboarding/paging/page_screen.dart';

import 'components/page_counter.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  List<OnboardingModel> models = [];
  int _index = 0;

  var _controller = PageController(keepPage: true, initialPage: 0);

  _OnBoardingScreen() {
    models.add(
      OnboardingModel(
          title: "Collect points in Pappasi App!",
          desc:
              "Collect points with each purchase and exchange them for exclusive offers and rewards!",
          image: "assets/images/welcome_login.png"),
    );

    models.add(
      OnboardingModel(
          title: "Exclusive Offers in Your Town",
          desc:
              "We offer amazing and exclusice offers that you can redeem at your location!",
          image: "assets/images/join_back.png"),
    );

    models.add(
      OnboardingModel(
          title: "Collect points in Pappasi App!",
          desc:
              "Collect points with each purchase and exchange them for exclusive offers and rewards!",
          image: "assets/images/onboarding.png"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: models.length,
            onPageChanged: (value) {
              setState(() {
                _index = value;
              });
            },
            itemBuilder: (context, index) => PageScreen(
              model: models[index],
            ),
          ),
          Center(
            child: Column(
              children: [
                Spacer(
                  flex: 3,
                ),
                PageCounter(
                  count: 3,
                  index: _index,
                ),
                Spacer(flex: 1),
                Expanded(
                  child: _index != models.length - 1
                      ? Column(
                          children: [
                            Container(
                              width: 250,
                              child: CustomButton(
                                borderColor: kPrimery,
                                color: kPrimery,
                                textColor: Colors.white,
                                text: "continue".toUpperCase(),
                                onPressed: _continue,
                              ),
                            ),
                            Container(
                              width: 250,
                              child: CustomButton(
                                borderColor: Colors.white,
                                color: Colors.white,
                                textColor: kPrimery,
                                text: "skip".toUpperCase(),
                                onPressed: () => _gotoCityScreen(context),
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              width: 250,
                              child: CustomButton(
                                borderColor: kPrimery,
                                color: kPrimery,
                                textColor: Colors.white,
                                text: "let's go".toUpperCase(),
                                onPressed: () => _gotoCityScreen(context),
                              ),
                            ),
                            Spacer()
                          ],
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _continue() {
    setState(() {
      _index += 1;
      _controller.animateToPage(_index,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    });
  }

  void _gotoCityScreen(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => CityScreen(), fullscreenDialog: true));
  }
}
