import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/Log_in_cubit/log_in_cubit.dart';
import 'package:store/Featured/Login_register/Widgets/log_in_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static String id = "LogInView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: const Scaffold(body: LogInViewBody()),
    );
  }
}
