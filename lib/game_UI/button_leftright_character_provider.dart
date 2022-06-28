import 'package:flutter/cupertino.dart';

class ButtonLeftRightCharacterProvider with ChangeNotifier {
  int _ns = 0;
  int get ns => _ns;
  set ns(int ns) {
    _ns = ns;
    notifyListeners();
  }
}
