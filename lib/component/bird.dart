import 'package:flame/components.dart';
import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flappy_bird/component/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/component/ground.dart';
import 'package:flappy_bird/game.dart';
class Bird extends SpriteComponent with CollisionCallbacks {
  @override
/*
initiial the brid
position
size
*/
Bird() :super(size: Vector2(birdWidth,birdHeight), position: Vector2(birdStartX,birdStartY));
// physics of the bird
 double velocity = 0; 
  /*
load the sprite image
  */
  @override  
  Future<void> onLoad() async {
    sprite = await Sprite.load('bird.png');
  
  // hitbox
  add(RectangleHitbox());
  }
    /*
jump
  */
  void flap() {
    velocity = jumpStrength;
  }
    /*
update every second
  */
@override
  void update (double dt){
  super.update(dt);
  velocity += gravity * dt;
  position.y += velocity * dt;}

  // collusion with the ground
  @override
  onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // if the bird collides with the ground or pipes
    if (other is Ground) {
      (parent as flappyBirdGame).gameOver();
    }
    if(other is Pipe){
        (parent as flappyBirdGame).gameOver();

}
  }
  //collusion with the pipe



}