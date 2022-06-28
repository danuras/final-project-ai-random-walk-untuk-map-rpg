import 'package:bonfire/bonfire.dart';

import '../../main.dart';
import 'slime.dart';

class SlimeController extends StateController<Slime> {
  double attack = 20;
  bool _seePlayerToAttackMelee = false;
  bool enableBehaviors = true;

  @override
  void update(double dt, Slime slime) {
    if (!enableBehaviors) return;
    if (component == null) return;

    _seePlayerToAttackMelee = false;

    component?.seeAndMoveToPlayer(
      closePlayer: (player) {
        component?.execAttack(attack);
      },
      observed: () {
        _seePlayerToAttackMelee = true;
      },
      radiusVision: tileSize * 1.5,
    );

    if (!_seePlayerToAttackMelee) {
      component?.seeAndMoveToAttackRange(
        minDistanceFromPlayer: tileSize * 2,
        positioned: (p) {
          component?.execAttackRange(attack);
        },
        radiusVision: tileSize * 3,
        notObserved: () {
          component?.runRandomMovement(
            dt,
            speed: component!.speed / 2,
            maxDistance: (tileSize * 3).toInt(),
          );
        },
      );
    }
  }
}
