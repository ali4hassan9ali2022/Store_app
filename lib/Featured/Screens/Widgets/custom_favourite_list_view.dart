import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Cubit/store_cubit/store_state.dart';
import 'package:store/Featured/Screens/Widgets/custom_favourite_item.dart';

class CustomFavouriteListView extends StatelessWidget {
  const CustomFavouriteListView({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<StoreCubit>(context);
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder:
              (context, index) => CustomFavuriteItem(
                favouritesModel: cubit.favouritesModel!.data!.data![index],
              ),
          separatorBuilder:
              (context, index) =>
                  const Divider(color: Colors.grey, thickness: 0, height: 30),
          itemCount: cubit.favouritesModel!.data!.data!.length,
        );
      },
    );
  }
}
