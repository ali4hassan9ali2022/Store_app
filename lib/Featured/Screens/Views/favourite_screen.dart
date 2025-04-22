import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Cubit/store_cubit/store_state.dart';
import 'package:store/Featured/Screens/Widgets/custom_favourite_list_view.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = BlocProvider.of<StoreCubit>(context);
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {
        if (state is SuccessGetFavouriteStoreApp) {
          if (!state.favouritesModel.status!) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.deepOrange,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                content: Center(
                  child: Text(state.favouritesModel.message.toString()),
                ),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! LoadingGetFavouriteStoreApp,
          builder: (context) {
            return const CustomFavouriteListView();
          },
          fallback: (context) {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
