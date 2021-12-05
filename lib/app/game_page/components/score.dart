import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  const Score({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: 40,
      child: Text(
        "Pontuação: $score",
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
