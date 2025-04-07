import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/Log_in_cubit/log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(InitialLogInState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();


  IconData suffix = Icons.visibility_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix =
        isObsecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePassworsVisibailitystate());
  }
} 
