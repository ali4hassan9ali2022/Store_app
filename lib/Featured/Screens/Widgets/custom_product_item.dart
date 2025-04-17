import 'package:flutter/material.dart';

import 'package:store/Featured/Screens/Widgets/custom_grid_view.dart';
import 'package:store/Featured/Screens/Widgets/custom_list_view_categories.dart';
import 'package:store/Featured/Screens/Widgets/custom_slider_carousel.dart';
import 'package:store/Featured/Screens/Widgets/custom_text_title.dart';
import 'package:store/Models/categories_mode.dart';
import 'package:store/Models/home_model.dart';

class CustomPeoductItem extends StatelessWidget {
  const CustomPeoductItem({
    super.key,
    required this.homeModel,
    required this.categoriesModel,
  });
  final HomeModel homeModel;
  final CategoriesModel categoriesModel;
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
          CustomListViewCategories(categoriesModel: categoriesModel),
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


