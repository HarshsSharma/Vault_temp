import 'package:flutter/material.dart';
import 'package:vault/appconfig.dart';
import 'package:vault/src/core/router/router.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  //final AppConfig config;
  const MyApp({super.key, required this.appRouter,}); //required this.config});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vault',
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
