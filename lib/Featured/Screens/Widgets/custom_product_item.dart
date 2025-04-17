import 'package:flutter/material.dart';
import 'package:store/Featured/Screens/Widgets/custom_categories_item.dart';
import 'package:store/Featured/Screens/Widgets/custom_grid_view.dart';
import 'package:store/Featured/Screens/Widgets/custom_slider_carousel.dart';
import 'package:store/Models/home_model.dart';

class CustomPeoductItem extends StatelessWidget {
  const CustomPeoductItem({super.key, required this.homeModel});
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSliderCarousel(homeModel: homeModel),
          const SizedBox(height: 15),
          const Text(
            "Categories",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
         const CustomCategoriesItem(),
          const SizedBox(height: 8),
          const Text(
            "New Product",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 15),
          CustomGridView(homeModel: homeModel),
        ],
      ),
    );
  }
}


