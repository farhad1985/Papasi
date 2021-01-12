import 'package:papasi/domain/model/models.dart';

abstract class IServiceGroup {
  Future<List<ServiceGroup>> fetchServiceGroups();
  Future<List<Shope>> fetchShopsService({String serviceGroupId, City city});
  Future<ShopeDetail> fetchShopDetail({String id});
  Future<List<Voucher>> fetchOffers({String id});
  Future<Offer> fetchOneOffer({String id});
  Future<String> fetchQRVoucher({bool isRedeem, String voucherId});
}
