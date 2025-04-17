import 'package:flutter/material.dart';
import 'package:store/Featured/Screens/Widgets/custom_categories_item.dart';
import 'package:store/Models/categories_mode.dart';

class CustomListViewCategories extends StatelessWidget {
  const CustomListViewCategories({
    super.key,
    required this.categoriesModel,
  });

  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => CustomCategoriesItem(
              dataModel: categoriesModel.data!.data![index],
            ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: categoriesModel.data!.data!.length,
      ),
    );
  }
}