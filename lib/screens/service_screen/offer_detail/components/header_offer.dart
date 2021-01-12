import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/service_screen/shope_detail/components/tag.dart';
import 'package:papasi/data/core/extension/ex_int.dart';

class HeaderOffer extends StatelessWidget {
  final Offer offer;

  const HeaderOffer({
    Key key,
    this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              offer.imageUrl ?? "",
              width: 48,
              height: 48,
            ),
            Text(
              offer.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Image.asset(
                  offer.getConsumePlaceImageURL(),
                  width: 48,
                  height: 48,
                ),
                SizedBox(width: 8),
                Text(
                  offer.consumePlace ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                Tag(
                  title: offer.typeName ?? '',
                  isGain: offer.isGain,
                  isRedeem: offer.isRedeem,
                )
              ],
            ),
            Row(
              children: [
                Text('Exp Date : ${offer.endDate.toDateWithSeperate()}'),
                SizedBox(width: 16),
                Text('|'),
                SizedBox(width: 16),
                Text('Total Number : ${offer.usageCount ?? 0}')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
