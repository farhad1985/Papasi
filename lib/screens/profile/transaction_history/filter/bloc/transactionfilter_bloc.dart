import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/domain/model/models.dart';

part 'transactionfilter_event.dart';
part 'transactionfilter_state.dart';

class TransactionfilterBloc
    extends Bloc<TransactionfilterEvent, TransactionfilterState> {
  TransactionfilterBloc() : super(TransactionfilterInitial());

  @override
  Stream<TransactionfilterState> mapEventToState(
    TransactionfilterEvent event,
  ) async* {
    if (event is SelectedVoucherTypeEvent) {
      yield SelectedVoucherTypeState(voucherType: event.voucherType);
    } else if (event is SelectedLocoalfferTypeEvent) {
      yield SelectedLocoalfferTypeState(voucherType: event.voucherType);
    }
  }
}
