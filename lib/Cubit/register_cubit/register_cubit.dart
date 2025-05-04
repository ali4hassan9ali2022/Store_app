import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/register_cubit/resgister_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() :super(RegisterInitialStates());
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailRController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordRController = TextEditingController();
  IconData suffix = Icons.visibility_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix =
        isObsecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePassworsVisibailitystate());
  }
  
}
