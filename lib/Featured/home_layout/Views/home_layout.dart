import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Controllers/Navigato_to.dart';
import 'package:store/Cubit/App_cubit/app_cubit.dart';
import 'package:store/Cubit/App_cubit/app_state.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Cubit/store_cubit/store_state.dart';
import 'package:store/Featured/search/Views/search_view.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  static String id = "HomeLayout";
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<StoreCubit>(context);
    var mode = BlocProvider.of<AppCubit>(context);
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Ali"),
            actions: [
              IconButton(
                onPressed: () {
                  NavigatoTo.pushNamedTo(context, SearchView.id);
                },
                icon: const Icon(Icons.search),
              ),
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      mode.changeAppMode();
                    },
                    icon: Icon(
                      mode.isDark ? Icons.dark_mode : Icons.light_mode,
                    ),
                  );
                },
              ),
            ],
          ),

          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeBottomNavBar(value);
            },
            items: cubit.icons,
          ),
        );
      },
    );
  }
}
