import 'package:flutter/material.dart';

class DescriptionOffer extends StatelessWidget {
  final String desc;

  const DescriptionOffer({
    Key key,
    this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          SizedBox(height: 8),
          Text(
            desc ?? '',
            style: TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
