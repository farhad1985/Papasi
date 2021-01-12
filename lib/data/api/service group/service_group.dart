import 'package:graphql/client.dart';
import 'package:papasi/data/api/route/config_graph.dart';
import 'package:papasi/data/graphql/operations/service_group_query.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';

class ServiceGroupService extends IServiceGroup {
  Future<List<ServiceGroup>> fetchServiceGroups() async {
    final _client = await GraphQLConfig().getClient();

    final options = QueryOptions(
      documentNode: gql(ServiceGroupQuery.serviceGroup),
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw result.exception;
    }
    final data = result.data["serviceGroups"];
    return List<ServiceGroup>.from(data.map((e) => ServiceGroup.fromJSON(e)))
        .toList();
  }

  @override
  Future<List<Shope>> fetchShopsService(
      {String serviceGroupId, City city}) async {
    final _client = await GraphQLConfig().getClient();

    final options = QueryOptions(
        documentNode: gql(ServiceGroupQuery.serviceByGroup),
        variables: {
          "serviceGroupId": serviceGroupId,
          "lat": city.lat,
          "long": city.lng,
          "cityId": city.id
        });

    final result = await _client.query(options);

    if (result.hasException) {
      throw result.exception;
    }
    final data = result.data["servicesByGroup"];
    return List<Shope>.from(data.map((e) => Shope.fromJSON(e))).toList();
  }

  @override
  Future<ShopeDetail> fetchShopDetail({String id}) async {
    final _client = await GraphQLConfig().getClient();
    final options = QueryOptions(
      documentNode: gql(ServiceGroupQuery.shopDetail),
      variables: {'id': id},
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data['findOneService'];
    return ShopeDetail.fromJSON(data);
  }

  @override
  Future<List<Voucher>> fetchOffers({String id}) async {
    final _client = await GraphQLConfig().getClient();
    final options = QueryOptions(
      documentNode: gql(ServiceGroupQuery.moreShope),
      variables: {'serviceId': id},
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data['vouchersByService'];
    return List<Voucher>.from(data.map((e) => Voucher.fromJSON(e)));
  }

  @override
  Future<Offer> fetchOneOffer({String id}) async {
    final _client = await GraphQLConfig().getClient();
    final options = QueryOptions(
      documentNode: gql(ServiceGroupQuery.findOneVoucher),
      variables: {'id': id},
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data['findOneVoucher'];
    return Offer.fromJSON(data);
  }

  @override
  Future<String> fetchQRVoucher({bool isRedeem, String voucherId}) async {
    final _client = await GraphQLConfig().getClient();

    final options = QueryOptions(
      documentNode: gql(ServiceGroupQuery.getQR),
      variables: {
        'isRedeem': isRedeem,
        'voucherId': voucherId,
      },
    );

    final result = await _client.query(options);

    if (result.hasException) {
      throw result.exception;
    }

    return result.data['getQR'].toString();
  }
}
