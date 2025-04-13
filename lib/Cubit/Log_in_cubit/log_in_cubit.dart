import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Api/cache_dio.dart';
import 'package:store/Core/Api/end_ponits.dart';
import 'package:store/Cubit/Log_in_cubit/log_in_state.dart';
import 'package:store/Models/log_in_model.dart';

class LogInCubit extends Cubit<LoginStates> {
  LogInCubit() : super(ShopLoginInitialStates());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  late LoginModel logInModel;

  IconData suffix = Icons.visibility_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix =
        isObsecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePassworsVisibailitystate());
  }

 void userLogin({required String email, required String password}) async {
    emit(ShopLoginLoadingStates());
    try {
      final response = await DioHelper.postData(
        url: lOGIN,
        data: {
          'email': email,
          'password': password,
        },
      );
      logInModel = LoginModel.fromjson(response.data);
      // print(LoginModel.data.token);
      // print(LoginModel?.status);
      // print(LoginModel?.message);
      if (logInModel.status!) {
        emit(ShopLoginSucssesStates(logInModel));
      } else {
        emit(ShopLoginSErrorStates(
            logInModel.message ?? 'Unknown error occurred'));
      }
    } catch (error) {
      print(error.toString());
      emit(ShopLoginSErrorStates(
          'Failed to authenticate. Please try again later.'));
    }
  }
}
