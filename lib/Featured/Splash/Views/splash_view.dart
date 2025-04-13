import 'package:flutter/material.dart';
import 'package:store/Featured/Splash/Widgets/custom_animation_splash_view.dart';
import 'package:store/Featured/Splash/Widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key, required this.isBoarding});
  static String id = "SplashView";
  final bool isBoarding;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomAnimationSplashView(
        child:  SplashViewBody(
          isBoarding: isBoarding,
        ),
      ),
    );
  }
}


