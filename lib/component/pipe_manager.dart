import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';
import '../component/pipe.dart';
class PipeManager extends Component with HasGameRef<flappyBirdGame> {
  PipeManager() : super();
   
// update every second ---contunieuse spawn of pipes
double pipeSpawnTimer = 0;
@override
void update(double dt) {
  pipeSpawnTimer += dt;

if(pipeSpawnTimer > pipeInterval){
  pipeSpawnTimer =0;
  spawnPipe();
}

  }
  
  void spawnPipe() {
    final double screenHieght = gameRef.size.y;

// calculation the piep hight

  //max possible hieght of the top pipe
final double maxPipeHieght =screenHieght - groundHeight - pipeGap - minPipeHeight;
  //hight of the bottom pipe randome select betwinn min and max
  final double bottomPipeHeight = minPipeHeight + Random().nextDouble() * (maxPipeHieght - minPipeHeight);
  
  
  // hieght of the top pipe 
  final double topPipeHeight =screenHieght - bottomPipeHeight - pipeGap;

  
  //-----------------------//
  // create the bottom pipe
final bottomPipe = Pipe(
  //position,
  Vector2(gameRef.size.x, screenHieght - groundHeight - topPipeHeight),
  
//  size,
  Vector2(pipeWidth, topPipeHeight),
  isTopPipe: true);


  // create the top pipe
final topPipe = Pipe(

  //position,
  Vector2(gameRef.size.x, 0),
//  size,
  Vector2(pipeWidth, screenHieght - groundHeight - pipeGap - topPipeHeight),
  isTopPipe: false      
);

// add the pipes to the game
gameRef.add(bottomPipe);
gameRef.add(topPipe);
  
  }}