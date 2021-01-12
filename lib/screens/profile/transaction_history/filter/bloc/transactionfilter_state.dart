part of 'transactionfilter_bloc.dart';

@immutable
abstract class TransactionfilterState {}

class TransactionfilterInitial extends TransactionfilterState {}

class SelectedVoucherTypeState extends TransactionfilterState {
  final VoucherType voucherType;

  SelectedVoucherTypeState({this.voucherType});
}

class SelectedLocoalfferTypeState extends TransactionfilterState {
  final VoucherType voucherType;

  SelectedLocoalfferTypeState({this.voucherType});
}
