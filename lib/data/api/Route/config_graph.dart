import 'package:graphql/client.dart';
import 'package:papasi/data/sql/profileDAL.dart';

class GraphQLConfig {
  Future<GraphQLClient> getClient() async {
    final profile = await ProfileDAL.shared().getProfile();

    HttpLink httpLink = HttpLink(
      uri: 'http://178.33.86.240:4000/graphql',
      headers: <String, String>{
        'Authorization': 'Bearer ${profile.token}',
      },
    );

    return GraphQLClient(link: httpLink, cache: InMemoryCache());
  }
}
