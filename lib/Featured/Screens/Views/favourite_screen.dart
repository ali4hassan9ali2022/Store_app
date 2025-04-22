import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Featured/Screens/Widgets/custom_favourite_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<StoreCubit>(context);
    return const CustomFavuriteItem();
  }
}


