import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';

class VoucherLevel extends StatelessWidget {
  final bool isCurrent;
  final Level level;

  const VoucherLevel({
    Key key,
    this.isCurrent = false,
    this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Current Level',
              style: TextStyle(
                fontSize: 17,
                color: isCurrent ? Colors.black87 : Colors.grey[400],
              )),
          SizedBox(height: 8),
          Opacity(
              opacity: isCurrent ? 1 : 0.3,
              child: Image.asset('assets/icons/papasi-default.png')),
          SizedBox(height: 8),
          Text(
            level.name ?? '',
            style: TextStyle(
              fontSize: 18,
              color: isCurrent ? Colors.black : Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '${level.discountPercent ?? 0}%',
            style: TextStyle(
              fontSize: 19,
              color: isCurrent ? Colors.black : Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '(Discount)',
            style: TextStyle(
              color: isCurrent ? Colors.grey : Colors.grey[400],
            ),
          )
        ],
      ),
    );
  }
}
