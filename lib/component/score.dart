import 'package:flame/components.dart';
import 'package:flappy_bird/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreText extends TextComponent with HasGameRef<flappyBirdGame>{

//init
ScoreText() : super (text: '0',
textRenderer: TextPaint(style : TextStyle(
  color: Colors.blueGrey,
  fontSize: 48,
  fontWeight: FontWeight.bold
)) );

//load 
@override
Future<void> onLoad() async {
  
  // set the position
  position = Vector2((

    gameRef.size.x - size.x)/ 2,
    
    gameRef.size.y - size.y - 50);
}

//update
@override
void update(double dt){
  final newText =gameRef.score.toString();
  if(text !=newText){
    text =newText ;
  }

}
}