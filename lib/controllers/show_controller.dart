import 'package:flutter/cupertino.dart';

class ShowController extends ChangeNotifier {
  static ShowController instance = ShowController();

  bool showNumbers = true;

  toggleShow() {
    this.showNumbers = !this.showNumbers;
    notifyListeners();
  }
}
