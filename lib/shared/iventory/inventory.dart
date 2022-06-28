import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/shared/interface/shorcut_player_item.dart';
import 'package:final_project_ai/shared/iventory/draggable_widget_custom.dart';
import 'package:final_project_ai/shared/iventory/equipment_preview.dart';
import 'package:final_project_ai/shared/iventory/header_box.dart';
import 'package:final_project_ai/shared/iventory/item_box.dart';
import 'package:final_project_ai/shared/iventory/shorcut_item.dart';
import 'package:final_project_ai/shared/util/player_sprite_sheet/robot_sprite_sheet.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => InventoryState();
}

class InventoryState extends State<Inventory> {
  List<Widget> _listOfDraggableGridItem = [];
  List<Widget> _listOfEquipment = [];
  @override
  void initState() {
    _generateInventoryData();
    _generateEquipmentData();

    super.initState();
  }

  void _generateInventoryData() {
    for (int i = 0; i < 100; i++) {
      _listOfDraggableGridItem.add(
        DraggableWidgetCustom(
          Container(
            height: tileSize,
            width: tileSize,
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
            child: Center(
              child: Text(
                i.toString(),
                style: TextStyle(fontSize: 8, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }
  }

  void _generateEquipmentData() {
    for (int i = 0; i < 10; i++) {
      _listOfEquipment.add(
        DraggableWidgetCustom(
          Container(
            height: tileSize,
            width: tileSize,
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
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0x22000000),
                Color(0x77000000),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  HeaderBox(
                    "Item Box",
                    BorderRadius.only(
                      topLeft: Radius.circular(tileSize),
                    ),
                  ),
                  ItemBox(_listOfDraggableGridItem),
                  //dragable grid kedua
                  ShorcutItem(ShorcutPlayerItem.listOfShorcut),
                ],
              ),
              SizedBox(
                height: double.infinity,
                width: tileSize * 8,
                child: Column(
                  children: [
                    HeaderBox(
                      "Player",
                      BorderRadius.only(
                        topRight: Radius.circular(tileSize),
                      ),
                    ),
                    EquipmentPreview(_listOfEquipment),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xff6b0015),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(25),
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.undo,
                color: Color(0xffaaaaaa),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
/* 
class _GridItem extends StatelessWidget {
  const _GridItem({required this.image, Key? key}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.padding_small,
        vertical: Dimens.padding_small,
      ),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
 */