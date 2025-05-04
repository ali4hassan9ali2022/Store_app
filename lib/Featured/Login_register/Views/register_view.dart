import 'package:flutter/material.dart';
import 'package:store/Featured/Login_register/Widgets/resgister_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = "RegisterView";
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: RegisterViewBody(),
    );
  }
}