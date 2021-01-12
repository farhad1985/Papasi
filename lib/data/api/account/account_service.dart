import 'package:graphql/client.dart';
import 'package:papasi/data/api/Route/config_graph.dart';
import 'package:papasi/data/graphql/operations/account_query.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/account.dart';

class AccountService extends IAccountService {
  @override
  Future<User> fetchProfile() async {
    final client = await GraphQLConfig().getClient();
    final options = QueryOptions(
      documentNode: gql(AccountQuery.profile),
    );

    final result = await client.query(options);

    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data["me"];
    return User.fromJSON(data);
  }
}
