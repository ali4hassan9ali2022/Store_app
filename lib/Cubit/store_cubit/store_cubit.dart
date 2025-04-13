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
  List<Widget> bottomScreens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavouriteScreen(),
    const SettingScreen(),
  ];
  List<BottomNavigationBarItem> icons = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.grid_view_sharp),
      label: 'Categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favourite',
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavStoreState());
  }
}
