import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/profile/transaction_history/filter/bloc/transactionfilter_bloc.dart';
import 'package:papasi/screens/profile/transaction_history/filter/components/column_filter.dart';

class TransactionFilterScreen extends StatefulWidget {
  @override
  _TransactionFilterScreenState createState() =>
      _TransactionFilterScreenState();
}

class _TransactionFilterScreenState extends State<TransactionFilterScreen> {
  final _bloc = TransactionfilterBloc();

  _TransactionFilterScreenState() {
    _bloc
      ..add(SelectedVoucherTypeEvent(voucherType: VoucherType.cachback))
      ..add(SelectedLocoalfferTypeEvent(voucherType: VoucherType.cachback));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Filter'),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder(
            cubit: _bloc,
            builder: (context, state) {
              if (state is SelectedVoucherTypeState) {
                return ColumnFilter(
                  title: 'Choose offer type',
                  voucherType: state.voucherType,
                  onPress: (value) =>
                      _bloc.add(SelectedVoucherTypeEvent(voucherType: value)),
                );
              }
              if (state is SelectedLocoalfferTypeState) {
                return ColumnFilter(
                  title: 'Choose of local offer type',
                  voucherType: state.voucherType,
                  onPress: (value) => _bloc
                      .add(SelectedLocoalfferTypeEvent(voucherType: value)),
                );
              }

              return Container();
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
