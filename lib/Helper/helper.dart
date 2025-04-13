import 'package:flutter/material.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Core/Controllers/Navigato_to.dart';
import 'package:store/Featured/Login_register/Views/register_view.dart';
import 'package:store/Featured/Splash/Views/splash_view.dart';
import 'package:store/Featured/home_layout/Views/home_layout.dart';
import 'package:store/Featured/on_boarding/Views/on_boarding_view.dart';
import 'package:store/Featured/search/Views/search_view.dart';

import '../Featured/Login_register/Views/log_in_view.dart';

abstract class Helper {
  static void submit(BuildContext context) {
    CacheHelper.saveDate(key: "onBoarding", value: true).then((value) {
      if (value) {
        NavigatoTo.pushNamedAndRemoveTo(context, LogInView.id);
      }
    });
  }

  static Map<String, Widget Function(BuildContext)> routes = {
    SplashView.id: (context) => const SplashView(),
    OnBoardingView.id: (context) => const OnBoardingView(),
    LogInView.id: (context) => const LogInView(),
    RegisterView.id: (context) => const RegisterView(),
    HomeLayout.id: (context) => const HomeLayout(),
    SearchView.id: (context) => const SearchView(),
  };
}
