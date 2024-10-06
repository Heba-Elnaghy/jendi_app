import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jendi_app/core/constants/api_keys.dart';
import 'package:sahha_flutter/sahha_flutter.dart';

import '../../data/mock/mock_data.dart';
import '../../data/models/score_model.dart';
import '../../data/repositories/health_repository.dart';
import '../../data/services/health_service.dart';
import '../../core/utils/logger.dart';
import 'health_state.dart';

class HealthCubit extends Cubit<HealthState> {
  final HealthRepository _healthRepository = HealthRepository();
  final HealthService _healthService = HealthService();

  HealthCubit() : super(HealthInitial());

  void configureSahha() async {
    try {
      await SahhaFlutter.configure(
        environment: SahhaEnvironment.sandbox,
      );
      log('Sahha SDK configured successfully.');
      emit(HealthConfigured());
    } catch (e) {
      log('Failed to configure Sahha SDK: $e');
      emit(HealthError('Failed to configure Sahha SDK: $e'));
    }
  }

  void authenticateSahha() async {
    try {
      await SahhaFlutter.authenticate(
        appId: ApiKeys.appId,
        appSecret: ApiKeys.appSecret,
        externalId: "EXTERNAL_ID",
      );
      log('Sahha SDK authenticated successfully.');
      emit(HealthAuthenticated());
    } catch (e) {
      log('Failed to authenticate Sahha SDK: $e');
      emit(HealthError('Failed to authenticate Sahha SDK: $e'));
    }
  }

  void enableSensors() async {
    try {
      bool isAvailable = await _healthService.isHealthDataAvailable();
      if (isAvailable) {
        bool isAuthorized = await _healthService.requestAuthorization();
        if (isAuthorized) {
          log('HealthKit authorization granted.');
          emit(HealthSensorsEnabled());
        } else {
          log('HealthKit authorization denied.');
          emit(HealthSensorsDisabled());
        }
      } else {
        log('Health data is not available on this device.');
        emit(HealthDataUnavailable());
      }
    } catch (e) {
      log(e.toString());
      emit(HealthError(e.toString()));
    }
  }

  void getScores() async {
    try {
      List<ScoreModel> scores = await _healthRepository.getScores();
      if (scores.isEmpty) {
        log('No scores available.');
        emit(HealthNoScores());
      } else {
        emit(HealthScoresLoaded(scores));
      }
    } catch (e) {
      log(e.toString());
      emit(HealthError(e.toString()));
    }
  }

  void loadMockData() {
    emit(HealthScoresLoaded(mockScoreResponse.inferences));
  }
}