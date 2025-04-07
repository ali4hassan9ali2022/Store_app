import 'package:flutter/material.dart';
import 'package:store/Core/utils/assets.dart';

class CustomOnBoardingItem extends StatelessWidget {
  const CustomOnBoardingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset(Assets.imagesECommerce)),
        const SizedBox(height: 30),
        const Text(
          "Title",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          "Sub Title",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
