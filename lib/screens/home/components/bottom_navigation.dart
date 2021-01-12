import 'package:flutter/material.dart';
import 'package:papasi/screens/home/components/tab_bar_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
    @required int selectedItem,
    this.updateSelectedItem,
  })  : _selectedItem = selectedItem,
        super(key: key);

  final int _selectedItem;
  final ValueChanged<int> updateSelectedItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -1),
              blurRadius: 1,
              color: Colors.grey.withAlpha(80),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TabBarItem(
              icon: "assets/icons/dashobard.png",
              title: "Home",
              isSelected: _selectedItem == 0,
              onTap: () {
                updateSelectedItem(0);
              },
            ),
            TabBarItem(
              icon: "assets/icons/service.png",
              title: "Service",
              isSelected: _selectedItem == 1,
              onTap: () {
                updateSelectedItem(1);
              },
            ),
            TabBarItem(
              icon: "assets/icons/scan.png",
              title: "Scan",
              isSelected: _selectedItem == 2,
              onTap: () {
                updateSelectedItem(2);
              },
            ),
            TabBarItem(
              icon: "assets/icons/profile.png",
              title: "Profile",
              isSelected: _selectedItem == 3,
              onTap: () {
                updateSelectedItem(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
