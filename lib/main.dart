import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/splash_cubit/splash_cubit.dart';
import 'package:store/Featured/Splash/Views/splash_view.dart';
import 'package:store/Featured/on_boarding/Views/on_boarding_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.id: (context) => const SplashView(),
          OnBoardingView.id: (context) => const OnBoardingView(),
        },
        initialRoute: SplashView.id,
      ),
    );
  }
}
