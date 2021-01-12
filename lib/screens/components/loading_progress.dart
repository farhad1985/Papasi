import 'package:flutter/material.dart';

abstract class LoadingProgress {
  void showLoading(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Container(
        child: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text(
              'Loading data ...',
              style: TextStyle(fontSize: 19),
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}
