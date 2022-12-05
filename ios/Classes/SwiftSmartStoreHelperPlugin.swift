import Flutter
import UIKit
import MobileSync

public class SwiftSmartStoreHelperPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "smart_store_helper", binaryMessenger: registrar.messenger())
    let instance = SwiftSmartStoreHelperPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    registrar.addApplicationDelegate(instance)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS supimpas" + UIDevice.current.systemVersion)
  }

}
