import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/dashboard/dashboard_screen.dart';
import 'package:papasi/screens/profile/main/profile_screen.dart';
import 'package:papasi/screens/scan/scan_screen.dart';
import 'package:papasi/screens/service_screen/service_group/service_screen.dart';

import 'components/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedItem = 0;
  var pages;
  PageController _controller;

  _HomeScreen() {
    _controller = PageController(
      initialPage: 0,
      keepPage: true,
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: kGreyLight,
      bottomNavigationBar: BottomNavigation(
        selectedItem: _selectedItem,
        updateSelectedItem: _updateSeletedItem,
      ),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          DashboardScreen(),
          GroupServiceScreen(),
          ScanScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }

  void _updateSeletedItem(int index) {
    setState(() {
      _selectedItem = index;
      _controller.jumpToPage(index);
    });
  }
}
