import 'package:intl/intl.dart';

extension DateParsing on int {
  String toDateWithTime() {
    return DateTime.fromMillisecondsSinceEpoch(this).toString();
  }

  String toDate() {
    final date = DateTime.fromMillisecondsSinceEpoch(this);
    return DateFormat.yMMMEd().format(date).toString();
  }

  String toDateWithSeperate() {
    final date = DateTime.fromMillisecondsSinceEpoch(this);
    return DateFormat.yMd().format(date).toString();
  }

  String toTime() {
    final date = DateTime.fromMillisecondsSinceEpoch(this);
    return DateFormat.Hm().format(date).toString();
  }
}

extension Price on int {
  String toSeparate() {
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    return oCcy.format(this);
  }
}
