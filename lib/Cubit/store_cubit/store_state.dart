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