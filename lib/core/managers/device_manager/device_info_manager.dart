import 'package:device_info_plus/device_info_plus.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';

enum DeviceInfoType { DeviceModel, DeviceType, DeviceVersion }

class DeviceInfoManager {
  DeviceInfoManager._internal();

  static final DeviceInfoManager _instance = DeviceInfoManager._internal();
  static DeviceInfoManager get shared => _instance;
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  factory DeviceInfoManager() {
    return _instance;
  }

  Future<String?> getDeviceInfo(DeviceInfoType type) async {
    IosDeviceInfo? iosInfo;
    AndroidDeviceInfo? androidDeviceInfoInfo;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      iosInfo = await _deviceInfoPlugin.iosInfo;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      androidDeviceInfoInfo = await _deviceInfoPlugin.androidInfo;
    } else {
      // web // macOS // windows
    }

    switch (type) {
      case DeviceInfoType.DeviceModel:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? iosInfo!.model
            : androidDeviceInfoInfo!.model;
      case DeviceInfoType.DeviceType:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? iosInfo!.systemName
            : androidDeviceInfoInfo!.device;
      case DeviceInfoType.DeviceVersion:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? iosInfo!.systemVersion
            : androidDeviceInfoInfo!.version.release;
    }
  }
}
