import 'rate_summary.dart';
import 'voucher.dart';

class ShopeDetail {
  final String id;
  final String name;
  final int averageRate;
  final int myRate;
  final int totalReview;
  final String phone;
  final String desc;
  final String address;
  final List<Voucher> recentVouchers;
  final List<RateSummary> rateSummaries;

  ShopeDetail({
    this.id,
    this.name,
    this.phone,
    this.desc,
    this.address,
    this.averageRate,
    this.myRate,
    this.totalReview,
    this.recentVouchers,
    this.rateSummaries,
  });

  factory ShopeDetail.fromJSON(Map<String, dynamic> map) {
    return ShopeDetail(
      id: map['_id'],
      averageRate: map['ratesAverage'],
      myRate: map['myRate'],
      name: map['name'],
      phone: map['phone'],
      desc: map['description'],
      address: map['address'],
      rateSummaries: List<RateSummary>.from(
          map['ratesSummary'].map((e) => RateSummary.fromJSON(e)).toList()),
      recentVouchers: List<Voucher>.from(
          map['recentVouchers'].map((e) => Voucher.fromJSON(e))).toList(),
      totalReview: map['totalReviews'],
    );
  }
}
