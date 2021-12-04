import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_snake/app/components/piece.dart';
import 'package:game_snake/app/direction/direction.dart';
import 'package:game_snake/app/direction/direction_type.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Offset> positions = [];
  int length = 5;
  int step = 20;
  Direction direction = Direction.right;

  late Piece food;
  late Offset foodPosition;

  late double screenWidth;
  late double screenHeight;

  late int lowerBoundX, upperBoundX, lowerBoundY, upperBoundY;

  late Timer timer;
  double speed = 1;

  int score = 0;

  void draw() async {
    //TODO
  }

  Direction getRandomDirection(DirectionType type) {
    if (type == DirectionType.horizontal) {
      bool random = Random().nextBool();
      if (random) {
        return Direction.right;
      } else {
        return Direction.left;
      }
    } else if (type == DirectionType.vertical) {
      bool random = Random().nextBool();
      if (random) {
        return Direction.up;
      } else {
        return Direction.down;
      }
    } else {
      int random = Random().nextInt(4);
      return Direction.values[random];
    }
  }

  int roundToNearestTens(int num) {
    int divisor = step;
    int output = (num ~/ divisor) * divisor;
    if (output == 0) {
      output += step;
    }
    return output;
  }

  Offset getRandomPositionWithinRange() {
    int posX = Random().nextInt(upperBoundX) + lowerBoundX;
    int posY = Random().nextInt(upperBoundY) + lowerBoundY;
    return Offset(
      roundToNearestTens(posX).toDouble(),
      roundToNearestTens(posX).toDouble(),
    );
  }

  bool detectCollision(Offset position) {
    //TODO
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: const Text(
            "Gamer Over",
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            "Seu jogo acabou, mas vocẽ jogou bem. Sua ṕontuação foi: $score",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  restart();
                },
                child: Text(
                  "Restart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        );
      },
    );
  }

  Future<Offset> getNextPosition(Offset position) async {
    //TODO
  }

  void drawFood() {
    //TODO
  }

  List<Piece> getPieces() {
    //TODO
  }

  Widget getControls() {
    //TODO
  }

  void changeSpeed() {
    //TODO
  }

  void restart() {
    //TODO
  }

  Widget getPlayAreaBorder() {
    return Positioned(
      top: lowerBoundY.toDouble(),
      left: lowerBoundX.toDouble(),
      child: Container(
        width: (upperBoundX - lowerBoundX + step).toDouble(),
        height: (upperBoundY - lowerBoundY + step).toDouble(),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black.withOpacity(0.2),
          style: BorderStyle.solid,
          width: 1.0,
        )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    restart();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    lowerBoundX = step;
    lowerBoundY = step;
    upperBoundX = roundToNearestTens(screenWidth.toInt() - step);
    upperBoundY = roundToNearestTens(screenHeight.toInt() - step);

    return Scaffold(
      body: Container(
        color: Color(0XFFF5BB00),
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}