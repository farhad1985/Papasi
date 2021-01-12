import 'dart:typed_data';

import 'package:ef_qrcode/ef_qrcode.dart';
import 'package:flutter/material.dart';
import 'package:papasi/screens/components/custom_button.dart';
import 'package:papasi/screens/constant.dart';

class QRCodeVoucherDialog extends StatefulWidget {
  final String qrCodeStr;
  final String title;
  final bool isRedeem;

  const QRCodeVoucherDialog(
      {Key key, this.qrCodeStr, this.title, this.isRedeem})
      : super(key: key);

  @override
  _QRCodeVoucherDialogState createState() =>
      _QRCodeVoucherDialogState(qrCodeStr, title, isRedeem);
}

class _QRCodeVoucherDialogState extends State<QRCodeVoucherDialog> {
  final String qrCodeStr;
  final String title;
  final bool isRedeem;

  Uint8List _byte = Uint8List(0);

  _QRCodeVoucherDialogState(this.qrCodeStr, this.title, this.isRedeem) {
    _generateImage(qrCodeStr);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              Text(isRedeem ?? false ? 'Redeem' : 'Cashback'),
              SizedBox(height: 24),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.memory(
                    _byte,
                    width: 200,
                    height: 170,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('CODE :'),
                      Text(
                        '2342',
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future _generateImage(String text) async {
    try {
      Uint8List result = await EfQrcode.generate(content: text ?? '');
      setState(() {
        this._byte = result;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
