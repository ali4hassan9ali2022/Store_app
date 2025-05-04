import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Api/cache_dio.dart';
import 'package:store/Core/Api/end_ponits.dart';
import 'package:store/Cubit/register_cubit/resgister_state.dart';
import 'package:store/Models/log_in_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialStates());
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailRController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordRController = TextEditingController();
  IconData suffix = Icons.visibility_outlined;
  bool isObsecure = true;
  late LoginModel logInModel;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix =
        isObsecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePassworsVisibailitystate());
  }

  void userRegister() async {
    emit(LoadingRegisterState());
    try {
      final response = await DioHelper.postData(
        url: rEGISTER,
        data: {
          "name": nameController.text,
          "email": emailRController.text,
          "password": passwordRController.text,
          "phone": phoneController.text,
        },
      );
      logInModel = LoginModel.fromjson(response.data);
      if (logInModel.status!) {
        emit(SuccessRegisterState(loginModel: logInModel));
      } else {
        emit(
          FailureRegisterState(
            errMessage: logInModel.message ?? 'Unknown error occurred',
          ),
        );
      }
    } catch (error) {
      print(error.toString());
      emit(
        FailureRegisterState(
          errMessage: 'Failed to authenticate. Please try again later.',
        ),
      );
    }
  }
}
