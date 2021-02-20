import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  static DateTime now = DateTime.now();
  static DateFormat dateFormat = DateFormat("dd 'de' MMMM 'de' yyyy");

  getTodayDate() {
    return dateFormat.format(now);
  }
}
