import UIKit
import Flutter
import NMapsMap

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: "flutter/app",
                                              binaryMessenger: controller.binaryMessenger)
    
    methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) -> Void in
      if call.method == "setEnvironmentVariables" {
        if let args = call.arguments as? [String: Any] {
          if let clientId = args["NAVER_CLIENT_ID"] as? String {
            UserDefaults.standard.set(clientId, forKey: "NAVER_CLIENT_ID")
            NMFAuthManager.shared().clientId = clientId
          }
        }
        result(nil)
      }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
