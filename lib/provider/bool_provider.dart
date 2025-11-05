import 'package:flutter/material.dart';

class BoolProvider extends ChangeNotifier {
  bool isTrue = true;
  bool hangerFunction() {
    isTrue = !isTrue;
    notifyListeners();
    return isTrue;
  }
}
