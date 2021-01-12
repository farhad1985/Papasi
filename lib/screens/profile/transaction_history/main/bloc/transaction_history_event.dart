part of 'transaction_history_bloc.dart';

@immutable
abstract class TransactionHistoryEvent {}

class FetchTransactionHistory extends TransactionHistoryEvent {
  FetchTransactionHistory();
}
