abstract class LogInState {} 

  
class InitialLogInState extends LogInState{}
class LoadingLogInState extends LogInState{}
class SuccuseLogInState extends LogInState{}
class FailureLogInState extends LogInState{
  final String errMessage;

  FailureLogInState({required this.errMessage});
}
class ChangePassworsVisibailitystate extends LogInState{

}