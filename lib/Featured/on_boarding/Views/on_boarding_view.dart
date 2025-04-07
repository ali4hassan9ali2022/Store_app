import 'package:flutter/material.dart';
import 'package:store/Featured/Login_register/Views/log_in_view.dart';
import 'package:store/Featured/on_boarding/Widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String id = "OnBoardingView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                LogInView.id,
                (route) => false,
              );
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}
