import 'package:flutter/material.dart';

import '../../constant.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildUserPoint(),
              _buildLinearProgressIndicator(),
              _buildLevel(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildUserPoint() {
    return Row(
      children: <Widget>[
        Flexible(child: _buildBalance(), flex: 1),
        _buildLine(),
        Flexible(child: _buildPapasi(), flex: 1),
      ],
    );
  }

  Container _buildLine() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      color: kBorder,
      width: 1,
      padding: EdgeInsets.all(24),
    );
  }

  Column _buildPapasi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "0",
              style: TextStyle(color: kGreenLight, fontSize: 28),
            ),
            SizedBox(width: 8),
            Image.asset("assets/icons/diamond.png")
          ],
        ),
        Text(
          "Your Papasi",
          style: TextStyle(fontSize: 11),
        )
      ],
    );
  }

  Column _buildBalance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "20",
              style: TextStyle(color: kGreenLight, fontSize: 28),
            ),
            SizedBox(width: 8),
            Image.asset("assets/icons/dollar.png")
          ],
        ),
        Text(
          "Your Blance",
          style: TextStyle(fontSize: 11),
        )
      ],
    );
  }

// How much user gets Papasi
  ClipRRect _buildLinearProgressIndicator() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        backgroundColor: kBorder,
        value: 0.2,
      ),
    );
  }

// Show user's Level
  Row _buildLevel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "0/5 - Silver Level",
          style: TextStyle(fontSize: 9, color: Color(0XFF10889C)),
        ),
        Text(
          "Get 5 Papasi to reach Gold Level",
          style: TextStyle(fontSize: 9, color: kGrey),
        )
      ],
    );
  }
}
