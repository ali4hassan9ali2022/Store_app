import 'package:flutter/material.dart';
import 'package:store/Featured/Login_register/Widgets/log_in_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static String id = "LogInView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LogInViewBody(),
    );
  }
}