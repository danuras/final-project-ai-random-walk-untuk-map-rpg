import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ai/game_UI/button_leftright_character_provider.dart';
import 'package:final_project_ai/game_UI/button_ok_setcharacter_provider.dart';
import 'package:final_project_ai/game_UI/list_of_player.dart';
import 'package:final_project_ai/game_UI/list_of_widget_player.dart';
import 'package:final_project_ai/game_UI/selected_character_provider.dart';
import 'package:final_project_ai/play_menu.dart';
import 'package:final_project_ai/shared/iventory/recoil_item_provider.dart';
import 'package:final_project_ai/shared/util/common_sprite_sheet/potion_sprite_sheet.dart';

import 'menu.dart';
import 'menu_fp.dart';
import 'my_behavior.dart';
import 'shared/enemy/slime_controller.dart';
import 'shared/interface/bar_life_controller.dart';
import 'package:provider/provider.dart';

double tileSize = 32.0, maxHeight = 100;

enum LocationSet {
  left,
  right,
  top,
  bottom,
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  await SpriteSheetPotion.load();
  BonfireInjector().putFactory((i) => SlimeController());
  BonfireInjector().put((i) => BarLifeController());

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RecoilItemProvider>(
          create: (context) => RecoilItemProvider(),
        ),
        ChangeNotifierProvider<ButtonOkSetCharacterProvider>(
          create: (context) => ButtonOkSetCharacterProvider(),
        ),
        ChangeNotifierProvider<ButtonLeftRightCharacterProvider>(
          create: (context) => ButtonLeftRightCharacterProvider(),
        ),
        ChangeNotifierProvider<SelectedCharacterProvider>(
          create: (context) => SelectedCharacterProvider(),
        ),
        ChangeNotifierProvider<ListOfWidgetPlayer>(
          create: (context) => ListOfWidgetPlayer(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Game',
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SafeArea(
          child: MenuFP(),
        ),
      ),
    );
  }
}
