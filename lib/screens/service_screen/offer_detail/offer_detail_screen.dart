import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/components/custom_button.dart';
import 'package:papasi/screens/components/loading_progress.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/service_screen/offer_detail/bloc/offerdetail_bloc.dart';
import 'package:papasi/screens/service_screen/offer_detail/components/qrcode_voucher_dialog.dart';
import 'package:papasi/screens/service_screen/offer_detail/components/select_voucher_type_dialog.dart';
import 'components/description_offer.dart';
import 'components/header_offer.dart';
import 'components/reward_option.dart';

class OfferDetailScreen extends StatefulWidget {
  final Offer offer;

  OfferDetailScreen({Key key, this.offer}) : super(key: key);

  @override
  _OfferDetailScreenState createState() => _OfferDetailScreenState(offer);
}

class _OfferDetailScreenState extends State<OfferDetailScreen>
    with LoadingProgress {
  final Offer offer;
  final _bloc = OfferdetailBloc();

  _OfferDetailScreenState(this.offer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyLight,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  HeaderOffer(offer: widget.offer),
                  RewardOption(levels: widget.offer.levels ?? []),
                  DescriptionOffer(desc: widget.offer.description),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: 300,
              height: 75,
              child: BlocListener<OfferdetailBloc, OfferdetailState>(
                listener: (context, state) {
                  if (state is LoadingOfferDetail) {
                    _dismissDialog(context);
                    showLoading(context);
                  } else if (state is FailureOffer) {
                    _dismissDialog(context);
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(state.err)));
                  } else if (state is SuccessOffer) {
                    _dismissDialog(context);
                    showQRCodeDialog(context, state.qrCode, state.isRedeem);
                  } else if (state is SelectVoucherType) {
                    showSelectionDialog(context);
                  } else if (state is ShowDialogConfirm) {
                    showConfirmDialog(context, state.isRedeem, state.voucherId);
                  }
                },
                cubit: _bloc,
                child: BlocBuilder<OfferdetailBloc, OfferdetailState>(
                  cubit: _bloc,
                  buildWhen: (previous, current) =>
                      !(current is LoadingOfferDetail),
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () => _bloc.add(GetVoucher(
                        isRedeem: offer.isRedeem,
                        isGain: offer.isGain,
                        voucherId: offer.id,
                      )),
                      text: widget.offer.isGain && widget.offer.isRedeem
                          ? 'Get it now'.toUpperCase()
                          : widget.offer.typeName,
                      color: kPrimery,
                      textColor: Colors.white,
                      borderColor: kPrimery,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {},
        )
      ],
    );
  }

  void showConfirmDialog(
      BuildContext context, bool isRedeem, String voucherId) {
    Widget cancelButton = FlatButton(
      onPressed: () => _dismissDialog(context),
      child: Text("Cancel"),
    );

    Widget confirmButton = FlatButton(
      onPressed: () => _bloc
          .add(ConfirmGetVoucher(isRedeem: isRedeem, voucherId: voucherId)),
      child: Text("Confirm"),
    );

    AlertDialog alert = AlertDialog(
      actions: [cancelButton, confirmButton],
      title: Text("Alert"),
      content: Text("Are you sure koskhol?"),
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  void showSelectionDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: SelectVoucherTypeDialog(onPress: (value) {
                _dismissDialog(context);
                _bloc.add(
                    ShowConfirmDialog(isRedeem: value, voucherId: offer.id));
              }),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                .animate(animation),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 400),
        barrierLabel: 'close',
        barrierDismissible: true);
  }

  void showQRCodeDialog(BuildContext context, String qrCode, bool isRedeem) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: QRCodeVoucherDialog(
                qrCodeStr: qrCode,
                title: offer.name,
                isRedeem: isRedeem,
              ),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                .animate(animation),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 400),
        barrierLabel: 'close',
        barrierDismissible: true);
  }

  void _dismissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
