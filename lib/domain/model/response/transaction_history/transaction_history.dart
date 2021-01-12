import 'package:papasi/domain/model/models.dart';

class TransactionHistory {
  final String id;
  final String name;
  final JoinVenture jv;
  final Voucher voucher;

  TransactionHistory({this.id, this.name, this.jv, this.voucher});

  factory TransactionHistory.fromJSON(Map<String, dynamic> map) {
    return TransactionHistory(
      id: map['_id'],
      name: map['name'],
      jv: JoinVenture.fromJSON(map['jv']),
      voucher: Voucher.fromJSON(map['voucher']),
    );
  }
}
