import 'package:intl/intl.dart';

class DateConverter {
  /*
  * Converting date to (Ex:- Nov 30, 2020) from any DateTime format.
  * */
  String formatDate(String date) {
    return DateFormat.yMMMd().format(DateTime.parse(date));
  }
}
