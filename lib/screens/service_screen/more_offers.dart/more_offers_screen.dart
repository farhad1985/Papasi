import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/service_screen/shope_detail/components/offers.dart';

class MoreOffersScreen extends StatelessWidget {
  final List<Voucher> offers;

  const MoreOffersScreen({Key key, this.offers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('All offers'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            runSpacing: 8,
            children: _buildOffers(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOffers() {
    return offers.map((e) => OfferView(voucher: e)).toList();
  }
}
