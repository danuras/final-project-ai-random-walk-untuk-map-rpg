import 'package:flutter/cupertino.dart';

class SelectedCharacterProvider with ChangeNotifier {
  int _selected = 1;
  int get selected => _selected;
  set selected(int selectedChar) {
    _selected = selectedChar;
    notifyListeners();
  }
}
