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
import 'package:store/Models/changeFavouriteModel.dart';
import 'package:store/Models/favouriteModel.dart';
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
    DioHelper.getData(path: hOME, token: Helper.token)
        .then((value) {
          homeModel = HomeModel.fromjson(value.data);
          print(homeModel!.data!.banners?[0].image);
          for (var element in homeModel!.data!.products!) {
            if (element.inFavourites != null) {
              favorites[element.id!] = element.inFavourites!;
            } else {
              // Initialize with default value if in_favourites is null
              favorites[element.id!] = false;
            }
          }
          emit(SuccessStoreState());
        })
        .catchError((error) {
          emit(FailureStoreState(errMessage: error));
        });
  }

  CategoriesModel? categoriesModel;
  void getCategories() {
    DioHelper.getData(path: gETCATEGORIES, token: Helper.token)
        .then((value) {
          categoriesModel = CategoriesModel.fromJson(value.data);
          emit(SuccessCategorieesStoreState());
        })
        .catchError((error) {
          emit(FailureCategorieesStoreState(errMessage: error));
        });
  }

  ChangeFavouriteModel? changeFavouriteModel;
  void changeFavorites(int prodcutId) {
    favorites[prodcutId] = !favorites[prodcutId]!;
    emit(ChangeFavoritesStoreState());
    DioHelper.postData(
          url: gETFAVOURITE,
          data: {'product_id': prodcutId},
          token: Helper.token,
        )
        .then((value) {
          changeFavouriteModel = ChangeFavouriteModel.fromJson(value.data);
          if(!changeFavouriteModel!.status!) {
            favorites[prodcutId] = !favorites[prodcutId]!;
          } else {
            getFavourite();
          }
          emit(SuccessChangeFavoritesStoreState(
            model: changeFavouriteModel!,
          ));
        })
        .catchError((error) {
          favorites[prodcutId] = !favorites[prodcutId]!;
          emit(FailureChangeFavoritesStoreState(errMessage: error));
        });
  }
  FavouritesModel? favouritesModel;
  void getFavourite() {
    emit(LoadingGetFavouriteStoreApp());
    DioHelper.getData(path: gETFAVOURITE, token: Helper.token)
        .then((value) {
          favouritesModel = FavouritesModel.fromJson(value.data);
          emit(SuccessGetFavouriteStoreApp(
            favouritesModel: favouritesModel!,
          ));
        })
        .catchError((error) {
          emit(FailureGetFavouriteStoreApp(errMessage: error));
        });
  }
}
