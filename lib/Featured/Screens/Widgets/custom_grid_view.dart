import 'package:flutter/material.dart';
import 'package:store/Featured/Screens/Widgets/grid_item.dart';
import 'package:store/Models/home_model.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.homeModel});

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      childAspectRatio: 1 / 1.63,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(homeModel.data!.products!.length, (index) {
        return ProductItem(productModel: homeModel.data!.products![index]);
      }),
    );
  }
}
