import 'package:flutter/material.dart';

import '../../constant.dart';

class TabBarItem extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String title;
  final Function onTap;

  const TabBarItem({
    Key key,
    this.isSelected = false,
    this.icon,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 8),
            Image.asset(
              icon,
              height: 24,
              color: isSelected ? kPrimery : kGrey,
            ),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? kPrimery : kGrey,
                fontSize: 9,
              ),
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
