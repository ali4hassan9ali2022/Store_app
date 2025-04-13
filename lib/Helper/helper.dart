import 'package:flutter/material.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Core/Controllers/Navigato_to.dart';

import '../Featured/Login_register/Views/log_in_view.dart';

abstract class Helper {
  static void submit(BuildContext context) {
    CacheHelper.saveDate(key: "onBoarding", value: true).then((value) {
      if (value) {
      NavigatoTo.pushNamedAndRemoveTo(context, LogInView.id);
      }
    });
  }

  static void scaffoldMessenger(
    BuildContext context,
    Widget child,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      
      SnackBar(content: child),);
  }
}
