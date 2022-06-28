import 'package:flutter/cupertino.dart';

class RecoilItemProvider with ChangeNotifier {
  Widget _recoil = Text("");
  Widget get recoil => _recoil;
  set recoil(Widget widget) {
    _recoil = widget;
    notifyListeners();
  }
}
