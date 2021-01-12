import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constant.dart';

class RatingReview extends StatelessWidget {
  const RatingReview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
          child: Column(
            children: [
              Text(
                "4/5",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                "12 review",
                style: TextStyle(color: kGrey, fontSize: 12),
              ),
              SizedBox(height: 8),
              RatingBarIndicator(
                rating: 2.5,
                itemCount: 5,
                itemSize: 17.0,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ));
  }
}
