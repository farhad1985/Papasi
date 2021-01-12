import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/profile/transaction_history/detail/transaction_detail.dart';
import 'package:papasi/screens/profile/transaction_history/filter/transaction_filter.dart';

import 'bloc/transaction_history_bloc.dart';
import 'components/transaction_item.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final _bloc = TransactionHistoryBloc();

  _TransactionScreenState() {
    _bloc.add(FetchTransactionHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        child: BlocListener<TransactionHistoryBloc, TransactionHistoryState>(
          listener: (context, state) {
            if (state is FailureState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.err)));
            }
          },
          cubit: _bloc,
          child: BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
            builder: (context, state) {
              if (state is SuccessTransactionHistoryState) {
                return _buildListView(context, list: state.list);
              } else if (state is LoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              return Container();
            },
            cubit: _bloc,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Transaction"),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.tune),
          onPressed: () => _gotoTransactionFilter(context),
        )
      ],
    );
  }

  ListView _buildListView(BuildContext context,
      {List<TransactionHistory> list}) {
    return ListView.builder(
      itemCount: list.length,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      itemBuilder: (context, index) {
        return TransactionItem(
          item: list[index],
          onPress: (value) =>
              _gotoTransactionDetailScreen(context, list[index]),
        );
      },
    );
  }

  void _gotoTransactionDetailScreen(
      BuildContext context, TransactionHistory item) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TransactionDetailScreen(item: item),
        fullscreenDialog: true));
  }

  void _gotoTransactionFilter(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TransactionFilterScreen(),
    ));
  }
}
