import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Pipe extends SpriteComponent with CollisionCallbacks , HasGameRef<flappyBirdGame> {

// determine if the pipe is top or bottom
final  bool isTopPipe;
// init 
Pipe(Vector2 position, Vector2 size,{required this.isTopPipe}) : super(position: position, size: size);
bool scored = false ;
// load the image
@override
Future<void> onLoad() async {
  sprite = await Sprite.load(isTopPipe ? 'pipedown.png' : 'pipeup.png');
  // add a hitbox to the pipe
  add(RectangleHitbox());
}

// update every second
@override
void update(double dt) {
  // move the pipe to the left
  position.x -= pipeScrollingspeed * dt;
// check if the bird has passed the pipe
if(!scored && position.x +size.x<gameRef.bird.position.x){
  scored =true;
//avoid double counting fro; the top pipe
if(isTopPipe){
  gameRef.incrementScore();
}

}

  // remove the pipe if it goes off screen
  if (position.x + size.x < 0) {
    removeFromParent();       



  }}
  }