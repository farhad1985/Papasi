import 'dart:typed_data';

import 'package:ef_qrcode/ef_qrcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papasi/domain/model/response/transaction_history/transaction_history.dart';
import 'package:papasi/screens/components/custom_button.dart';

import 'dart:io' show Platform;
import 'package:papasi/data/core/papa_core.dart';
import 'package:papasi/screens/constant.dart';

import 'components/offer_name.dart';
import 'components/transaction_date.dart';
import 'components/transaction_expire_date.dart';
import 'components/transaction_price.dart';

class TransactionDetailScreen extends StatefulWidget {
  final TransactionHistory item;

  const TransactionDetailScreen({Key key, this.item}) : super(key: key);

  @override
  _TransactionDetailScreenState createState() =>
      _TransactionDetailScreenState(item: item);
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  final TransactionHistory item;

  Uint8List _byte = Uint8List(0);

  _TransactionDetailScreenState({this.item});

  @override
  void initState() {
    super.initState();

    _generateImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TransactionOfferName(title: item.voucher.name ?? ''),
            SizedBox(height: 16),
            TransactionExpireDate(date: item.voucher.endDate.toDate()),
            SizedBox(height: 16),
            TransactionPrice(price: (item.voucher.price ?? 0).toSeparate()),
            SizedBox(height: 16),
            TransactionDate(
              date: (item.voucher.startDate ?? 0).toDate(),
              time: (item.voucher.startDate ?? 0).toTime(),
            ),
            SizedBox(height: 16),
            Divider(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.memory(
                    _byte,
                    width: 200,
                    height: 130,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('CODE :'),
                      Text(
                        item.voucher.name.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 250,
                    child: CustomButton(
                      color: kPrimery,
                      textColor: Colors.white,
                      borderColor: kPrimery,
                      text: 'copy code'.toUpperCase(),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: (Platform.isAndroid)
              ? Icon(Icons.share)
              : Icon(
                  CupertinoIcons.share,
                  size: 28,
                ),
          onPressed: () {},
        )
      ],
    );
  }

  Future _generateImage() async {
    try {
      Uint8List result = await EfQrcode.generate(content: item.voucher.name);
      setState(() {
        this._byte = result;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
