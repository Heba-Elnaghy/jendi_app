import '../../data/models/score_model.dart';

abstract class HealthState {}

class HealthInitial extends HealthState {}

class HealthConfigured extends HealthState {}

class HealthAuthenticated extends HealthState {}

class HealthSensorsEnabled extends HealthState {}

class HealthSensorsDisabled extends HealthState {}

class HealthDataUnavailable extends HealthState {}

class HealthScoresLoaded extends HealthState {
  final List<ScoreModel> scores;

  HealthScoresLoaded(this.scores);
}

class HealthNoScores extends HealthState {} 

class HealthError extends HealthState {
  final String message;

  HealthError(this.message);
}
