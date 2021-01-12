import 'package:flutter/material.dart';
import 'package:papasi/screens/constant.dart';

class SLATag extends StatelessWidget {
  const SLATag({
    Key key,
    @required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "${count ?? 0} offers",
          style: TextStyle(
            fontSize: 12,
            color: kPrimery,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: Color(0xFF20D9D3),
        )
      ],
    );
  }
}
