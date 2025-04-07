import 'package:flutter/material.dart';

class CustomAnimationSplashView extends StatelessWidget {
  const CustomAnimationSplashView({
    super.key, required this.child,
  });
  final Widget child; 
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(
        begin: Colors.deepPurple.shade50,
        end: Colors.purple.shade100,
      ),
      duration: const Duration(seconds: 4),
      builder: (context, color, child) {
        return AnimatedContainer(
          duration: const Duration(seconds: 4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color!, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}