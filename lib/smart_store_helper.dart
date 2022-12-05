
import 'dart:async';

import 'package:flutter/services.dart';

class SmartStoreHelper {
  static const MethodChannel _channel = MethodChannel('smart_store_helper');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
