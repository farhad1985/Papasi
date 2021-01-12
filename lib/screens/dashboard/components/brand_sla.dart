import 'package:flutter/material.dart';

class BrandSLA extends StatelessWidget {
  const BrandSLA({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2.4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  "assets/images/city.png",
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Name of the activity or event in two lines..."),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Image.asset("assets/icons/distance.png"),
                      Text("4.7"),
                      const SizedBox(width: 8),
                      Image.asset("assets/icons/star.png"),
                      Text("4")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
