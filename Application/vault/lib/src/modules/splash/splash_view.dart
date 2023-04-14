import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vault/src/core/helper/extentions/media_query.dart';

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
    final h = context.height * .6 > context.width
        ? context.width + 30
        : context.height * .6;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
      ),
      // body: OrientationBuilder(builder: (context, orientation) {
      //   return Container(
      //     padding: const EdgeInsets.symmetric(vertical: 30),
      //     alignment: Alignment.bottomCenter,
      //     height: double.infinity,
      //     width: double.infinity,
      //     decoration: BoxDecoration(
      //       image: DecorationImage(
      //           fit: BoxFit.fill,
      //           image: Image.asset(
      //             orientation == Orientation.portrait
      //                 ? 'assets/images/splash.png'
      //                 : 'assets/images/splash.png',
      //           ).image),
      //     ),
      //     // child: const Text(
      //     //   'An IMG ptoprietary system.\nCopyright \u00a9 2023 IMG Ltd. All Rights Reserved.',
      //     //   textAlign: TextAlign.center,
      //     //   style: TextStyle(color: Colors.white),
      //     // ),
      //   );
      // }),
      backgroundColor: Color(0xff062D7D),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ClipPath(
              clipper: WaveClipper(),
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment.topRight,
                        begin: Alignment.bottomLeft,
                        colors: [
                      Color(0xff0C4896),
                      Color(0xff085EAB),
                    ])),
                height: double.infinity,
                width: double.infinity,
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: context.height * .04),
              child: const Text(
                'An IMG ptoprietary system.\nCopyright \u00a9 2023 IMG Ltd. All Rights Reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Transform.translate(
              offset: Offset(30, h * .3),
              child: Transform.rotate(
                alignment: Alignment.topRight,
                angle: pi / 4,
                child: Container(
                  height: h,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xff033989),
                            Color(0xff0259AE),
                          ])),
                  child: Transform.rotate(
                    angle: -pi / 4,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: h * .3 + 75,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
              ],
            ),
          ),
          Positioned(
              top: h * .3 + 205,
              left: 0,
              right: 0,
              child: Text(
                'eApproval',
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final height = size.height;
    final width = size.width;

    final path = Path();
    path.lineTo(width * .4, 0);
    path.lineTo(0, width * .4);
    path.lineTo(0, height * .75);
    path.lineTo(0, height * .75);
    path.lineTo(width * .4, height * .98);
    path.lineTo(width, height * .65);
    path.lineTo(width, height * .80);
    path.lineTo(width * .8, height);
    path.lineTo(0, height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
