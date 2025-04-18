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