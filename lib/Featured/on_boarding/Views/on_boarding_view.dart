import 'package:flutter/material.dart';
import 'package:store/Featured/on_boarding/Widgets/on_boarding_view_body.dart';
import 'package:store/Helper/helper.dart';

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
              Helper.submit(context);
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