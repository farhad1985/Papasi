part of 'transaction_history_bloc.dart';

@immutable
abstract class TransactionHistoryState {}

class TransactionHistoryInitial extends TransactionHistoryState {}

class LoadingState extends TransactionHistoryState {}

class SuccessTransactionHistoryState extends TransactionHistoryState {
  final List<TransactionHistory> list;

  SuccessTransactionHistoryState({this.list});
}

class FailureState extends TransactionHistoryState {
  final String err;

  FailureState({this.err});
}
