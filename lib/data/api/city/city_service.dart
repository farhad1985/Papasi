import 'package:graphql/client.dart';
import 'package:papasi/data/api/Route/config_graph.dart';
import 'package:papasi/data/graphql/operations/city_queriy.dart';
import 'package:papasi/domain/model/response/city/city.dart';
import 'package:papasi/domain/usecase/api/city.dart';

class CityService extends ICityService {
  @override
  Future<List<City>> fetchCity({String name}) async {
    final client = await GraphQLConfig().getClient();
    final options = QueryOptions(
        documentNode: gql(CityQuery.city), variables: {"filter": name});

    final result = await client.query(options);

    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data["cities"];
    return List<City>.from(data.map((e) => City.fromJSON(e))).toList();
  }
}
