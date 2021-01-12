import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';

import 'voucher_level.dart';

class RewardOption extends StatelessWidget {
  final List<Level> levels;

  const RewardOption({
    Key key,
    this.levels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Reward option',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: VoucherLevel(
                      isCurrent: true,
                      level: levels[0],
                    ),
                  ),
                  Expanded(
                      child: VoucherLevel(
                    level: levels[1],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
