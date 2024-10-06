import Flutter
import UIKit
import HealthKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let healthKitChannel = FlutterMethodChannel(name: "com.example.healthkit",
                                                binaryMessenger: controller.binaryMessenger)
    healthKitChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "isHealthDataAvailable" {
        result(HKHealthStore.isHealthDataAvailable())
      } else if call.method == "requestAuthorization" {
        self.requestHealthKitAuthorization(result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func requestHealthKitAuthorization(result: @escaping FlutterResult) {
    let healthStore = HKHealthStore()
let allTypes = Set([
  HKObjectType.quantityType(forIdentifier: .stepCount)!,
  HKObjectType.quantityType(forIdentifier: .heartRate)!,
  HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
  
])

    healthStore.requestAuthorization(toShare: allTypes, read: allTypes) { (success, error) in
      if let error = error {
        result(FlutterError(code: "AUTHORIZATION_ERROR", message: error.localizedDescription, details: nil))
      } else {
        result(success)
      }
    }
  }
}