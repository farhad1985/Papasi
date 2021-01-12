part of 'transactionfilter_bloc.dart';

@immutable
abstract class TransactionfilterEvent {}

class SelectedVoucherTypeEvent extends TransactionfilterEvent {
  final VoucherType voucherType;

  SelectedVoucherTypeEvent({this.voucherType});
}

class SelectedLocoalfferTypeEvent extends TransactionfilterEvent {
  final VoucherType voucherType;

  SelectedLocoalfferTypeEvent({this.voucherType});
}
