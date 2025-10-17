import 'package:flame/components.dart';
import 'package:flappy_bird/game.dart';
import 'dart:async';
import 'package:flappy_bird/constants.dart';
import 'package:flame/collisions.dart';
class Ground extends SpriteComponent with HasGameRef<flappyBirdGame>, CollisionCallbacks {
  Ground() : super();

  @override
  Future<void> onLoad() async {

    size = Vector2(2* gameRef.size.x, groundHeight);
    position = Vector2(0, gameRef.size.y - groundHeight);
    // load the ground sprite
    sprite = await Sprite.load('G.png');


     // add a hitbox to the ground
    add(RectangleHitbox());
  }
// update every second
@override
void update(double dt){
//move ground to the left
position.x -= groundScrollingspeed * dt;
//reset ground if it goes off screen for initiate scroll  
// if half the ground has been passed  , reset
if (position.x +size.x /2 <=0 ){
  position.x = 0;
}


}

}