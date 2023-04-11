import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/bottom'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          alignment: Alignment.bottomCenter,
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(orientation == Orientation.portrait
                    ? 'assets/images/splash.jpg'
                    : 'assets/images/splash.jpg')),
          ),
          child: Text(
            'An IMG ptoprietary system.\nCopyright \u00a9 2023 IMG Ltd. All Rights Reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}
