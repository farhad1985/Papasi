import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/constant.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    "assets/images/profile.png",
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user.firstname,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                    Text(
                      user.email,
                      style: TextStyle(fontSize: 14, color: kTextColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 32,
            color: Color(0XFFEDFCFC),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: <Widget>[
                Image.asset("assets/icons/diamond.png"),
                SizedBox(width: 16),
                Text(
                  "Silver Level",
                  style: TextStyle(
                    fontSize: 11,
                    color: kPrimery,
                  ),
                ),
                Spacer(),
                Text(
                  "From : 2019/07 - 2020/06",
                  style: TextStyle(
                    fontSize: 11,
                    color: kPrimery,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
