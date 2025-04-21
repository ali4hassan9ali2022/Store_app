import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Api/cache_dio.dart';
import 'package:store/Core/Api/end_ponits.dart';
import 'package:store/Cubit/store_cubit/store_state.dart';
import 'package:store/Featured/Screens/Views/categories_screen.dart';
import 'package:store/Featured/Screens/Views/favourite_screen.dart';
import 'package:store/Featured/Screens/Views/products_screen.dart';
import 'package:store/Featured/Screens/Views/setting_screen.dart';
import 'package:store/Helper/helper.dart';
import 'package:store/Models/categories_mode.dart';
import 'package:store/Models/home_model.dart';

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
HomeModel? homeModel;
Map<int, bool?> favorites = {};
  void getData() {
    emit(LoadingStoreState());
    DioHelper.getData(path: hOME,
    token: Helper.token

    ).then((value) {
      homeModel = HomeModel.fromjson(value.data);
      print(homeModel!.data!.banners?[0].image);
      homeModel!.data!.products!.forEach((element) {
        favorites.addAll({
          element.id! : element.in_favourites,
        });
      },);
      emit(SuccessStoreState());
    },).catchError((error) {
      emit(FailureStoreState(
        errMessage: error
      ));
    });
  }
CategoriesModel? categoriesModel;
  void getCategories() {
    DioHelper.getData(path: gETCATEGORIES,
    token: Helper.token

    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(SuccessCategorieesStoreState());
    },).catchError((error) {
      emit(FailureCategorieesStoreState(
        errMessage: error
      ));
    });
  }

  void changeproduct_id(int prodcutId) {
    DioHelper.postData(url: gETFAVOURITE, data: {
      "product_id" : prodcutId
    }, token: Helper.token);
  }
}
