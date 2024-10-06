import 'package:sahha_flutter/sahha_flutter.dart';
import 'dart:convert';
import '../models/score_model.dart';
import '../../core/utils/logger.dart';

class HealthRepository {
  Future<List<ScoreModel>> getScores() async {
    try {
      final String result = await SahhaFlutter.getScoresDateRange(
        startDate: DateTime.now().subtract(const Duration(days: 1)),
        endDate: DateTime.now(),
        types: [SahhaScoreType.activity, SahhaScoreType.wellbeing],
      );

      final List<dynamic> data = jsonDecode(result);
      if (data.isEmpty) {
        log('No scores available in the response.');
        return [];
      }

      return data.map((json) => ScoreModel.fromJson(json)).toList();
    } catch (e) {
      log('Error parsing scores: $e');
      return [];
    }
  }
}
