import 'package:flutter/material.dart';
import 'package:papasi/screens/city/city_screen.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/registeration/join_account/join_account_screen.dart';

import 'components/balance_card.dart';
import 'components/brand_list.dart';
import 'components/home_slider.dart';
import 'components/sla_group_list.dart';

class DashboardScreen extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: kGreyLight,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            BalanceCard(),
            HomeSlider(controller: controller),
            BrandList(),
            BrandList(),
            BrandList(),
            SLAGroupList(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      actions: <Widget>[
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/icons/map.png"),
          ),
          onTap: () => _gotoCity(context),
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/icons/info.png"),
          ),
          onTap: () => _gotoSignIn(context),
        ),
      ],
      title: Text(
        "Home",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 8, left: 16),
            child: Text(
              "Caption and overline",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _gotoSignIn(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => JoinAccountScreen(),
      fullscreenDialog: true,
    ));
  }

  void _gotoCity(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CityScreen(),
      fullscreenDialog: true,
    ));
  }
}
