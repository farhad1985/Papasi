import 'package:graphql/client.dart';
import 'package:papasi/data/api/Route/config_graph.dart';
import 'package:papasi/data/graphql/operations/transaction_history_query.dart';
import 'package:papasi/domain/model/response/transaction_history/transaction_history.dart';
import 'package:papasi/domain/usecase/api/transaction_history.dart';

class TransactionHistoryService extends ITransactionHistory {
  @override
  Future<List<TransactionHistory>> fetchTransactionHistory(int page) async {
    final _client = await GraphQLConfig().getClient();
    final options = QueryOptions(
      documentNode: gql(TransactionHistoryQuery.transactionHisotry),
      variables: {'page': page},
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data['findAllTransaction'];
    return List<TransactionHistory>.from(
        data['data'].map((e) => TransactionHistory.fromJSON(e))).toList();
  }
}
