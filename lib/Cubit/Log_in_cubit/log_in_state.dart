import 'package:store/Models/log_in_model.dart';


abstract class LoginStates {}

class ShopLoginInitialStates extends LoginStates {}

class ShopLoginLoadingStates extends LoginStates {}

class ShopLoginSucssesStates extends LoginStates {
  final LoginModel? loginModel;
  ShopLoginSucssesStates(this.loginModel);
}

class ShopLoginSErrorStates extends LoginStates {
  final String error;
  ShopLoginSErrorStates(this.error);
}
class ChangePassworsVisibailitystate extends LoginStates{

}