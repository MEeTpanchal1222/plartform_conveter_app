import 'package:flutter/cupertino.dart';

class SwitchProvider extends ChangeNotifier {
  bool isAndroid = true;

  void changePlatform(bool value) {
    isAndroid = value;
    notifyListeners();
  }
}
