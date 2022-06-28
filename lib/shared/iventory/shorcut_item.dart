import 'package:flutter/material.dart';

import '../../main.dart';

class ShorcutItem extends StatelessWidget {
  ShorcutItem(this._listOfShorcut, {Key? key}) : super(key: key);
  List<Widget> _listOfShorcut = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileSize * 10,
      height: tileSize,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff6b0015),
          width: 2.0,
        ),
        gradient: RadialGradient(
          colors: [
            const Color(0x77000000),
            const Color(0xff6b0015).withOpacity(0.4),
          ],
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _listOfShorcut,
      ),
    );
  }
}
