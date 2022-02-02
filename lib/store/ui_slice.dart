import 'package:flutter/foundation.dart';

class UISlice with ChangeNotifier {
  bool isToggled = false;

  void toggleFilterHandler() {
    isToggled = !isToggled;
    notifyListeners();
  }
}
