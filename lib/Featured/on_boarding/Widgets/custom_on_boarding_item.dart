import 'package:flutter/material.dart';
import 'package:store/Models/on_boarding_model.dart';

class CustomOnBoardingItem extends StatelessWidget {
  const CustomOnBoardingItem({super.key, required this.items});
  final OnBoardingModel items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset(items.image)),
        const SizedBox(height: 30),
        Text(
          items.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          items.subTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
