import 'package:flutter/material.dart';


abstract class NavigatoTo {
  static void pushNamedAndRemoveTo(BuildContext context, widget) {
    Navigator.pushNamedAndRemoveUntil(
                context,
                widget,
                (route) => false,
              );
  }
  static void pushNamedTo(BuildContext context, widget) {
    Navigator.pushNamed(context, widget);
  }
}