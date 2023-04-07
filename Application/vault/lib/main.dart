import 'package:flutter/material.dart';
import 'package:vault/src/core/helper/network/dio_helper.dart';
import 'package:vault/src/core/router/router.dart';
import 'package:vault/src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
