import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Api/cache_dio.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Cubit/App_cubit/app_cubit.dart';
import 'package:store/Cubit/App_cubit/app_state.dart';
import 'package:store/Cubit/splash_cubit/splash_cubit.dart';
import 'package:store/Cubit/store_cubit/store_cubit.dart';
import 'package:store/Featured/Splash/Views/splash_view.dart';
import 'package:store/Helper/helper.dart';
import 'package:store/Theme/theme_mode.dart';
import 'package:store/simple_bloc_opserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocOpserver();
  DioHelper.dio;
  await CacheHelper.init();
  // Widget ali;
  bool? isDark = CacheHelper.getData(key: 'isDark');
  // bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  // var token = CacheHelper.getData(key: 'token') ?? "";

  // if (onBoarding != null) {
  //   if (token != null) {
  //     ali = const HomeLayout();
  //   } else {
  //     ali = const LogInView();
  //   }
  // } else {
  //   ali = const OnBoardingView();
  // }

  runApp(StoreApp(isDark: isDark));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key, this.isDark});
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(
          create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create:
              (context) =>
                  StoreCubit()
                    ..getData()
                    ..getCategories()
                    ..getFavourite()..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: Helper.routes,
            themeMode: BlocProvider.of<AppCubit>(context).isDark ? ThemeMode.dark : ThemeMode.light,
            theme: lightMode(),
            darkTheme: darkTheme(),
            // home: startView,
            initialRoute: SplashView.id,
          );
        },
      ),
    );
  }
}

//! heU92fUuH9yRl9e7rIigzn076NgYlGFYC6NnAr1ZRFGy6DvuKvEKRdtTQ02H3d7ZjXAnRw
// ? ThemeMode.dark
//                     : ThemeMode.light