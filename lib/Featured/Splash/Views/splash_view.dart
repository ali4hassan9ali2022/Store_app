import 'package:flutter/material.dart';
import 'package:store/Featured/Splash/Widgets/custom_animation_splash_view.dart';
import 'package:store/Featured/Splash/Widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = "SplashView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomAnimationSplashView(
        child: SplashViewBody(),
      ),
    );
  }
}
