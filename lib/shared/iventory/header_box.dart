import 'package:flutter/material.dart';

import '../../main.dart';

class HeaderBox extends StatelessWidget {
  HeaderBox(this._title, this._borderRadiusGeometry, {Key? key})
      : super(key: key);
  String _title;
  BorderRadiusGeometry _borderRadiusGeometry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileSize * ((_title == 'Player') ? 8 : 10),
      height: tileSize * 1.3,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff6b0015),
          width: 2.0,
        ),
        borderRadius: _borderRadiusGeometry,
        gradient: RadialGradient(
          colors: [
            const Color(0x77000000),
            const Color(0xff6b0015).withOpacity(0.4),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          _title,
          style: TextStyle(
            fontSize: tileSize * 0.5,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
