import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/transaction_history.dart/transaction_history_service.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/transaction_history.dart';

part 'transaction_history_event.dart';
part 'transaction_history_state.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  TransactionHistoryBloc() : super(TransactionHistoryInitial());

  bool _isAllow = true;
  int _page = 1;
  List<TransactionHistory> _datasource = [];
  ITransactionHistory _transactionHistoryService = TransactionHistoryService();

  @override
  Stream<TransactionHistoryState> mapEventToState(
    TransactionHistoryEvent event,
  ) async* {
    if (event is FetchTransactionHistory) {
      yield LoadingState();
      try {
        await _fetchTransactionHistory(_page);
        yield SuccessTransactionHistoryState(list: _datasource);
      } catch (e) {
        yield FailureState(err: e.toString());
      }
    }
  }

  Future _fetchTransactionHistory(int page) async {
    if (!_isAllow) {
      return;
    }

    final list = await _transactionHistoryService.fetchTransactionHistory(page);

    _isAllow = list.length > 0;
    _datasource += list;
    page++;
  }
}
