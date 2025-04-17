import 'package:flutter/material.dart';
import 'package:store/Featured/Screens/Widgets/custom_categories_item.dart';
import 'package:store/Featured/Screens/Widgets/custom_grid_view.dart';
import 'package:store/Featured/Screens/Widgets/custom_slider_carousel.dart';
import 'package:store/Featured/Screens/Widgets/custom_text_title.dart';
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CustomTextTitle(title: "Categories"),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const CustomCategoriesItem(),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 10,
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CustomTextTitle(title: "New Product"),
          ),
          const SizedBox(height: 15),
          CustomGridView(homeModel: homeModel),
        ],
      ),
    );
  }
}


