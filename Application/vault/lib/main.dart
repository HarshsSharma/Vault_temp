import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vault/appconfig.dart';
import 'package:vault/src/core/helper/network/dio_helper.dart';
import 'package:vault/src/core/router/router.dart';
import 'package:vault/src/my_app.dart';
late FlavorSettings settings;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   settings = await _getFlavorSettings();
  log('API URL ${settings.apiBaseUrl}');
  await DioHelper.init(settings.apiBaseUrl);
  runApp(MyApp(appRouter: AppRouter()));
  // runApp(MyApp(
  //   appRouter: AppRouter(),
  //   config: AppConfig(appName: 'Vault Prod', flavor: 'prod'),
  // ));
}
/// Contains the hard-coded settings per flavor.
class FlavorSettings {
  final String apiBaseUrl;
  final Color mainColor;

  // TODO Add any additional flavor-specific settings here.
  FlavorSettings.dev({this.apiBaseUrl='https://dev.flutter-flavors.chwe.at', this.mainColor=Colors.yellow});


  FlavorSettings.live({this.apiBaseUrl='https://dev.flutter-flavors.chwe.at', this.mainColor=const Color(0xff161652)});

}

Future<FlavorSettings> _getFlavorSettings() async {
  String? flavor = await const MethodChannel('flavor')
      .invokeMethod<String>('getFlavor');

  log('STARTED WITH FLAVOR $flavor');

  if (flavor == 'dev') {
    return FlavorSettings.dev();
  } else if (flavor == 'prod') {
    return FlavorSettings.live();
  } else {
    throw Exception("Unknown flavor: $flavor");
  }
}
