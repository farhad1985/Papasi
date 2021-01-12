import 'package:flutter/material.dart';
import 'rating_review.dart';

class Review extends StatelessWidget {
  const Review({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Review",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              RatingReview(),
              Row(
                children: [
                  // Text("Excellent"),
                  // Text("ssssss"),
                ],
              )
            ],
          ),
          LinearProgressIndicator(
            value: 1,
            backgroundColor: Colors.red,
            minHeight: 5,
          ),
        ],
      ),
    );
  }
}
