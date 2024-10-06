import 'package:flutter/material.dart';
import '../../data/models/score_model.dart';

class ScoreCard extends StatelessWidget {
  final ScoreModel score;

  const ScoreCard({required this.score, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Type: ${score.type}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('State: ${score.state}'),
            Text('Score: ${score.score}'),
            const SizedBox(height: 10),
            const Text(
              'Factors:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...score.factors.map((factor) {
              return Text('${factor.name}: ${factor.value}');
            }),
          ],
        ),
      ),
    );
  }
}