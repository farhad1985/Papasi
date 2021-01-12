import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16),
            child: Text(
              "What’s up Today?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/mac.png"))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
