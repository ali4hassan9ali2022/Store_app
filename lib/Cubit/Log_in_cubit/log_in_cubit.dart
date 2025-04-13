import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Api/cache_dio.dart';
import 'package:store/Core/Api/end_ponits.dart';
import 'package:store/Cubit/Log_in_cubit/log_in_state.dart';
import 'package:store/Models/log_in_model.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(InitialLogInState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  late LogInModel logInModel ;

  IconData suffix = Icons.visibility_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix =
        isObsecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePassworsVisibailitystate());
  }

  void userLogin({
    required String email ,required String passward
  }) {
    emit(LoadingLogInState());
    DioHelper.postData(url: lOGIN, data: {
      'email' : email,
      'password' : passward,
    }).then((value) {
     logInModel = LogInModel.fromJson(value);
      emit(SuccuseLogInState(logInModel: logInModel));
    },).catchError((error){
      emit(FailureLogInState(errMessage: error.toString()));
    });
  }
} 
