import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/service_screen/shope_detail/components/more_offers.dart';

import 'offers.dart';

class OfferList extends StatelessWidget {
  final Function onPressMore;
  final ValueChanged<Voucher> onPressOffer;

  const OfferList({
    Key key,
    @required this.shopeDetail,
    this.onPressMore,
    this.onPressOffer,
  }) : super(key: key);

  final ShopeDetail shopeDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(),
          SizedBox(height: 8),
          GridView.builder(
            itemCount: shopeDetail.recentVouchers.length > 4
                ? shopeDetail.recentVouchers.length + 1
                : shopeDetail.recentVouchers.length,
            itemBuilder: (context, index) {
              if (index > 4) {
                return MoreOffer(
                  onPressMore: onPressMore,
                );
              } else {
                return OfferView(
                  voucher: shopeDetail.recentVouchers[index],
                  onPress: onPressOffer,
                );
              }
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.4,
            ),
          )
          // Wrap(children: _buildOffers())
        ],
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      "Offers in here",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
