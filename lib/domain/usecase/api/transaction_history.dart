import 'package:papasi/domain/model/models.dart';

abstract class ITransactionHistory {
  Future<List<TransactionHistory>> fetchTransactionHistory(int page);
}
