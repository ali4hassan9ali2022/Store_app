import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Api/cache_dio.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Cubit/App_cubit/app_cubit.dart';
import 'package:store/Cubit/App_cubit/app_state.dart';
import 'package:store/Cubit/splash_cubit/splash_cubit.dart';
import 'package:store/Featured/Login_register/Views/log_in_view.dart';
import 'package:store/Featured/Login_register/Views/register_view.dart';
import 'package:store/Featured/Splash/Views/splash_view.dart';
import 'package:store/Featured/on_boarding/Views/on_boarding_view.dart';
import 'package:store/Theme/theme_mode.dart';
import 'package:store/simple_bloc_opserver.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocOpserver();
  DioHelper.dio;
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  runApp( StoreApp(
    isDark: isDark,
    onBoarding: onBoarding,
  ));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key, this.isDark, this.onBoarding});
final bool? isDark;
final bool? onBoarding;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(create: (context) => AppCubit()..changeAppMode(fromShared: isDark)),
        // BlocProvider(create: (context) => LogInCubit(),)
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              SplashView.id: (context) =>  SplashView(
                isBoarding: onBoarding!,
              ),
              OnBoardingView.id: (context) => const OnBoardingView(),
              LogInView.id: (context) => const LogInView(),
              RegisterView.id: (context) => const RegisterView(),
            },
            themeMode:  BlocProvider.of<AppCubit>(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
            theme: lightMode(),
            darkTheme: darkTheme(),
            initialRoute: SplashView.id,
          );
        },
      ),
    );
  }
}
