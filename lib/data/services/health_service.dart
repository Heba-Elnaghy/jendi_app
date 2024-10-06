import 'package:flutter/services.dart';

class HealthService {
  static const platform = MethodChannel('com.example.healthkit');

  Future<bool> isHealthDataAvailable() async {
    try {
      return await platform.invokeMethod('isHealthDataAvailable');
    } on PlatformException catch (e) {
      throw Exception("Failed to check health data availability: '${e.message}'.");
    }
  }

  Future<bool> requestAuthorization() async {
    try {
      return await platform.invokeMethod('requestAuthorization');
    } on PlatformException catch (e) {
      throw Exception("Failed to request HealthKit authorization: '${e.message}'.");
    }
  }
}