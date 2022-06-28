import 'package:flutter/material.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/shared/iventory/recoil_item_provider.dart';
import 'package:provider/provider.dart';

class DraggableWidgetCustom extends StatelessWidget {
  DraggableWidgetCustom(this.item, {Key? key}) : super(key: key);
  late Widget item;
  @override
  Widget build(BuildContext context) {
    return Consumer<RecoilItemProvider>(
      builder: (context, recoilItemProvider, _) => LongPressDraggable<Widget>(
        // Data is the value this Draggable stores.
        data: item,
        feedback: item,
        childWhenDragging: item,
        onDragCompleted: () {
          item = recoilItemProvider.recoil;
        },
        child: DragTarget<Widget>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return item;
          },
          onAccept: (Widget data) {
            recoilItemProvider.recoil = item;
            item = data;
          },
        ),
      ),
    );
  }
}
