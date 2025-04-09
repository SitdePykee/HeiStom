import 'package:intl/intl.dart';

extension NumExtensions on num {
  String toDateString() {
    return DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(toInt()));
  }

  String toDayCountString() {
    final date = DateTime.fromMillisecondsSinceEpoch(toInt());
    final diff = date.difference(DateTime.now()).inDays;
    if(diff == -1) return "Hôm qua";
    if(diff == 0) return "Hôm nay";
    return '${diff.abs()} ngày trước';
  }
}
