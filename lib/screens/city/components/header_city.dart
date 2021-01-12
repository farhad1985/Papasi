import 'package:flutter/material.dart';

import '../../constant.dart';

class HeaderCity extends StatelessWidget {
  const HeaderCity({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select your twon or city",
          style: textStyleHeader,
        ),
        SizedBox(height: 8),
        Text(
          "Input the name of another town, city or a destination",
          style: textStyleTitle,
        ),
      ],
    );
  }
}
