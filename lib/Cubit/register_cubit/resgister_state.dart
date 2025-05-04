import 'package:store/Models/log_in_model.dart';

abstract class RegisterState {}
class RegisterInitialStates extends RegisterState{}
class ChangePassworsVisibailitystate extends RegisterState{}
class LoadingRegisterState extends RegisterState{}
class SuccessRegisterState extends RegisterState{
final  LoginModel loginModel;

  SuccessRegisterState({required this.loginModel});
}
class FailureRegisterState extends RegisterState{
  final String errMessage;

  FailureRegisterState({required this.errMessage});
}