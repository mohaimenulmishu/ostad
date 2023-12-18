import 'package:firebase_score/models/score_model.dart';
import 'package:flutter/material.dart';

class ScoreDetails extends StatelessWidget {
  final ScoreModel score;
  const ScoreDetails({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${score.teamAName} vs ${score.teamBName}'),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${score.teamAName} vs ${score.teamBName}',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  '${score.teamAScore} : ${score.teamBScore}',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Time : ${score.spendTime.toStringAsFixed(2)} Min.',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total Time : ${score.totalTime.toStringAsFixed(2)} Min.',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
