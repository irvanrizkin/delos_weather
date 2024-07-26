import 'package:intl/intl.dart';

class DateFormatter {
  static String formatUnixDate(int unixTime, String format) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000, isUtc: true);
    return DateFormat(format).format(date.toLocal());
  }
}
