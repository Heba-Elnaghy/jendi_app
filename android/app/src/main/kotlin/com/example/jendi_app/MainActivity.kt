package com.example.jendi_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.healthkit"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "isHealthDataAvailable" -> {
                    result.success(isHealthDataAvailable())
                }
                "requestAuthorization" -> {
                    result.success(requestAuthorization())
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun isHealthDataAvailable(): Boolean {
        // Implement your logic to check health data availability
        return true
    }

    private fun requestAuthorization(): Boolean {
        // Implement your logic to request authorization
        return true
    }
}