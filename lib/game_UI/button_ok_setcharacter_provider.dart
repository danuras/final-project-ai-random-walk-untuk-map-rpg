import 'package:flutter/cupertino.dart';

class ButtonOkSetCharacterProvider with ChangeNotifier {
  bool _clicked = false;
  bool get clicked => _clicked;
  set clicked(bool isClicked) {
    _clicked = isClicked;
    notifyListeners();
  }
}
