import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Batu8 extends SimpleEnemy with ObjectCollision {
  Batu8(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/batu/batu8.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 64),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/batu/batu8.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 64),
              ),
            ),
          ),
          size: Vector2.all(tileSize * 2),
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 21 / 32, tileSize * 26 / 32),
            align: Vector2(tileSize * 7 / 32, tileSize * 33 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 20 / 32, tileSize * 29 / 32),
            align: Vector2(tileSize * 28 / 32, tileSize * 23 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 13 / 32, tileSize * 13 / 32),
            align: Vector2(tileSize * 48 / 32, tileSize * 23 / 32),
          ),
        ],
      ),
    );
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
