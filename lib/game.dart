import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappy_bird/component/background.dart';
import 'package:flappy_bird/component/bird.dart';
import 'package:flappy_bird/component/ground.dart';
import 'package:flappy_bird/component/pipe.dart';
import 'package:flappy_bird/component/pipe_manager.dart';
import 'package:flappy_bird/component/score.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class flappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
/*
basic game components will go here
bird
pipes
background
ground
score   
game over 
*/
late Bird bird;
late Background background;
late Ground ground;
late PipeManager pipeManager;
late ScoreText Scoretext ;


@override
FutureOr<void> onLoad()  {
/*
load the background
*/
background = Background(size);
add(background);
/*
add the bird
*/
  bird = Bird();
  add(bird);

 // laoud the ground
    ground = Ground();
    add(ground);


// load the pipe manager
pipeManager =PipeManager();
add(pipeManager);

// add score 
Scoretext =ScoreText();
add(Scoretext);

  return super.onLoad();

}



//
/*
when the screen is tapped
*/
@override
void onTap() {
  
  bird.flap();

}
//score 
int score = 0 ;
void incrementScore(){
  score +=1 ;
}

// game over
bool isGameOver = false;
void gameOver(){
  if (isGameOver) return;
  isGameOver = true;
  pauseEngine();
  // dialog box for the user
  if (buildContext != null) {
    showDialog(
      context: buildContext!,
      builder: (context) => AlertDialog(
        title: const Text('Game Over'),
        content:  Text('Hight score $score '),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
              resetGame();
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  } else {
    // If there's no BuildContext available, just reset the game as a fallback.
    resetGame();
  }
}

void resetGame() {
  bird.position = Vector2(birdStartX, birdStartY);
  bird.velocity = 0;
  isGameOver = false;
  score = 0 ;
  // resume all the pipe from the game

  children.whereType<Pipe>().forEach(
    (Pipe pipe)=>pipe.removeFromParent());
    resumeEngine();

}

}