import 'package:store/Models/log_in_model.dart';

abstract class LogInState {} 

  
class InitialLogInState extends LogInState{}
class LoadingLogInState extends LogInState{}
class SuccuseLogInState extends LogInState{
 final LogInModel logInModel;

  SuccuseLogInState({required this.logInModel});
}
class FailureLogInState extends LogInState{
  final String errMessage;

  FailureLogInState({required this.errMessage});
}
class ChangePassworsVisibailitystate extends LogInState{

}