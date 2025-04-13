import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/store_cubit/store_state.dart';
import 'package:store/Featured/Screens/Views/categories_screen.dart';
import 'package:store/Featured/Screens/Views/favourite_screen.dart';
import 'package:store/Featured/Screens/Views/products_screen.dart';
import 'package:store/Featured/Screens/Views/setting_screen.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(InitialStoreState());
  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavStoreState());
    List<Widget> bottomScreens = [
      const ProductsScreen(),
      const CategoriesScreen(),
      const FavouriteScreen(),
      const SettingScreen(),
    ];
  }
}
