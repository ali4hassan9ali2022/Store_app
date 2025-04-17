import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Cubit/store_cubit/store_state.dart';
import 'package:store/Featured/Screens/Widgets/custom_cat_item.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<StoreCubit>(context);
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CustomListViewitemCategory(cubit: cubit);
      },
    );
  }
}

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


