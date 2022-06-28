import 'package:flutter/material.dart';

import '../../main.dart';

class ItemBox extends StatelessWidget {
  ItemBox(this._listOfDraggableGridItem, {Key? key}) : super(key: key);
  List<Widget> _listOfDraggableGridItem = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: tileSize * 10,
        /* 
                      color: const Color(0x44000000), */
        child: Scrollbar(
          thumbVisibility: true,
          interactive: true,
          trackVisibility: true,
          child: Material(
            color: Colors.transparent,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                childAspectRatio: 1,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
              ),
              itemCount: 100,
              itemBuilder: (context, counter) {
                return _listOfDraggableGridItem[counter];
              },
            ),
          ),
        ),
      ),
    );
  }
}
