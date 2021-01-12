import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/components/circular_button_with_title.dart';

import '../../../constant.dart';

class InformationServiceDetail extends StatelessWidget {
  final ShopeDetail shopeDetail;

  const InformationServiceDetail({
    Key key,
    this.shopeDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildDescription(),
            SizedBox(height: 8),
            _buildExtra(),
            SizedBox(height: 8),
            Divider(color: kBorder),
            SizedBox(height: 8),
            _buildActions()
          ],
        ),
      ),
    );
  }

  Text _buildDescription() {
    return Text(
      shopeDetail.desc,
      style: TextStyle(
        fontSize: 11,
        color: kGrey,
      ),
    );
  }

  Row _buildExtra() {
    return Row(
      children: <Widget>[
        RatingBarIndicator(
          rating: 2.5,
          itemCount: 5,
          itemSize: 12.0,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
        Text(
          "${shopeDetail.averageRate} ( 12 reviews )",
          style: TextStyle(
            color: kGrey,
            fontSize: 11,
          ),
        ),
        Spacer(),
        Text(
          "Open Today",
          style: TextStyle(
            color: kPrimery,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CircularButtonWithTitle(
          title: "Call",
          onPressed: () {},
          image: Image.asset("assets/icons/calls.png"),
        ),
        CircularButtonWithTitle(
          title: "Directions",
          onPressed: () {},
          image: Image.asset("assets/icons/direction.png"),
        ),
        CircularButtonWithTitle(
          title: "Reviews",
          onPressed: () {},
          image: Image.asset("assets/icons/reviews.png"),
        ),
      ],
    );
  }
}
