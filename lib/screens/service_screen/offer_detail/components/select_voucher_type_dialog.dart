import 'package:flutter/material.dart';
import 'package:papasi/screens/components/custom_button.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/service_screen/shope_detail/components/button_checked_voucher.dart';

class SelectVoucherTypeDialog extends StatefulWidget {
  final ValueChanged<bool> onPress;

  const SelectVoucherTypeDialog({
    Key key,
    this.onPress,
  }) : super(key: key);

  @override
  _SelectVoucherTypeDialogState createState() =>
      _SelectVoucherTypeDialogState(onPress);
}

class _SelectVoucherTypeDialogState extends State<SelectVoucherTypeDialog> {
  final ValueChanged<bool> onPress;
  bool isRedeem = false;

  _SelectVoucherTypeDialogState(this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Please Select the Type of Offers',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonCheckedVoucher(
                          title: 'Cashback',
                          isSelected: !isRedeem,
                          onPress: (value) {
                            setState(() {
                              isRedeem = false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: ButtonCheckedVoucher(
                          title: 'Redeem',
                          isSelected: isRedeem,
                          onPress: (value) {
                            setState(() {
                              isRedeem = true;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                width: 300,
                height: 50,
                child: CustomButton(
                  onPressed: () => onPress(isRedeem),
                  text: 'get it'.toUpperCase(),
                  color: kPrimery,
                  textColor: Colors.white,
                  borderColor: kPrimery,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
