import 'package:flutter/material.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Core/Controllers/Navigato_to.dart';
import 'package:store/Featured/Login_register/Views/log_in_view.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  static String id = "HomeLayout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ali")),
      body: Center(
        child: TextButton(
          onPressed: () {
            CacheHelper.removetokenData(key: "token").then((value) {
              if (value) {
                NavigatoTo.pushNamedAndRemoveTo(context, LogInView.id);
              }
            });
          },
          child: const Text("SingOut"),
        ),
      ),
    );
  }
}
