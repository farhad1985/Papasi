import 'package:flutter/material.dart';

import '../constant.dart';

class StatusBrand extends StatelessWidget {
  final bool isOpen;

  const StatusBrand({
    Key key,
    this.isOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kPrimery, width: 1),
          color: kPrimery),
      child: Row(
        children: <Widget>[
          Text(
            "Open",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }
}
