import 'package:store/Models/changeFavouriteModel.dart';
import 'package:store/Models/favouriteModel.dart';

abstract class StoreState {

}

class InitialStoreState extends StoreState{}
class ChangeBottomNavStoreState extends StoreState{}
class LoadingStoreState extends StoreState{}
class SuccessStoreState extends StoreState{}
class FailureStoreState extends StoreState{
  final String errMessage;

  FailureStoreState({required this.errMessage});
}
class LoadingCategorieesStoreState extends StoreState{}
class SuccessCategorieesStoreState extends StoreState{}
class FailureCategorieesStoreState extends StoreState{
  final String errMessage;

  FailureCategorieesStoreState({required this.errMessage});
}

class SuccessChangeFavoritesStoreState extends StoreState{
  final ChangeFavouriteModel model;

  SuccessChangeFavoritesStoreState({required this.model});
}
class ChangeFavoritesStoreState extends StoreState{}
class FailureChangeFavoritesStoreState extends StoreState{
  final String errMessage;

  FailureChangeFavoritesStoreState({required this.errMessage});
}

class LoadingGetFavouriteStoreApp extends StoreState{}
class SuccessGetFavouriteStoreApp extends StoreState{
  final FavouritesModel favouritesModel;

  SuccessGetFavouriteStoreApp({required this.favouritesModel});
}
class FailureGetFavouriteStoreApp extends StoreState{
  final String errMessage;

  FailureGetFavouriteStoreApp({required this.errMessage});
}