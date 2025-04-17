import 'package:flutter/material.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Featured/Screens/Widgets/custom_cat_item.dart';

class CustomListViewitemCategory extends StatelessWidget {
  const CustomListViewitemCategory({
    super.key,
    required this.cubit,
  });

  final StoreCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => CustomCatItem(
              dataModel: cubit.categoriesModel!.data!.data![index],
            ),
        separatorBuilder:
            (context, index) =>
                const Divider(color: Colors.grey, thickness: 1, height: 50),
        itemCount: cubit.categoriesModel!.data!.data!.length,
      ),
    );
  }
}


