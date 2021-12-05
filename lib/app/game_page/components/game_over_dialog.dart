import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  final int score;
  final Function restart;
  const GameOverDialog({Key? key, required this.score, required this.restart }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              restart();
            },
            child: const Text(
              "Restart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
