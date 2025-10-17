# Flappy Bird Game
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Sofiane-apk/GameApp--FlappyBird-)

This repository contains a clone of the classic Flappy Bird game, built from the ground up using Flutter and the Flame game engine.

## Overview

This project is a mobile game application that recreates the well-known Flappy Bird experience. The player controls a bird, attempting to fly between columns of green pipes without hitting them. The game is built on the Flame engine, a modular 2D game engine for Flutter, which handles the game loop, rendering, and physics.

## Features

- **Classic Gameplay**: Tap the screen to make the bird "flap" and gain altitude.
- **Physics Engine**: Simple gravity and jump mechanics implemented for the bird's movement.
- **Procedural Generation**: Pipes are continuously and randomly generated for an endless challenge.
- **Collision Detection**: The game ends if the bird collides with pipes or the ground.
- **Scoring System**: The score increments for each pair of pipes the bird successfully passes through.
- **Game State Management**: Includes game over detection and a restart mechanism.

## Core Components

The game's logic is primarily contained within the `lib/` directory and is broken down into several key components:

- **`game.dart`**: The main `FlameGame` class that orchestrates the entire game. It manages game state (playing, game over), handles user input (taps), and holds all other game components.
- **`main.dart`**: The entry point for the Flutter application, which launches the `GameWidget`.
- **`lib/component/`**: This directory contains the individual game entities:
    - `bird.dart`: Defines the player-controlled bird, its appearance, physics (gravity, flapping), and collision logic.
    - `pipe_manager.dart`: Responsible for spawning pipes at regular intervals with random heights.
    - `pipe.dart`: Represents a single pipe (top or bottom), handling its movement across the screen.
    - `ground.dart`: A scrolling sprite component at the bottom of the screen that detects collisions.
    - `background.dart`: A static sprite for the game's background.
    - `score.dart`: A text component that displays the current score on the screen.
- **`constants.dart`**: A centralized file for all game-related constants, such as gravity, jump strength, scrolling speeds, and object dimensions.

## Getting Started

To run this project locally, follow these steps:

**Prerequisites:**
- Flutter SDK installed on your machine.

**Installation & Execution:**
1. Clone the repository to your local machine:
   ```sh
   git clone https://github.com/sofiane-apk/GameApp--FlappyBird-.git
   ```
2. Navigate to the project directory:
   ```sh
   cd GameApp--FlappyBird-
   ```
3. Install the required dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application on a connected device or emulator:
   ```sh
   flutter run
