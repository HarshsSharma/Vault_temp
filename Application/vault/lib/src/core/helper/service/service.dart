import 'dart:developer';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    log('first');
    if (status.isDenied) {
      if (Platform.isIOS) {
        openAppSettings();
        return false;
      } else {
        PermissionStatus status = await permission.request();
        log('seconed');
        if (status.isPermanentlyDenied || status.isDenied) {
          openAppSettings();
          log('setting2');
          return false;
        } else {
          return true;
        }
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      log('setting3');
      return false;
    } else {
      return true;
    }
  }

  static void requestPermissionFake(Permission permission) async {
    PermissionStatus status = await permission.request();
    log('first');
    if (status.isDenied) {
      requestPermissionFake(permission);
    }
  }
}
