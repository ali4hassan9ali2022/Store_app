import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Cubit/App_cubit/app_cubit.dart';
import 'package:store/Cubit/App_cubit/app_state.dart';
import 'package:store/Cubit/splash_cubit/splash_cubit.dart';
import 'package:store/Featured/Splash/Views/splash_view.dart';
import 'package:store/Featured/on_boarding/Views/on_boarding_view.dart';
import 'package:store/Theme/theme_mode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp( StoreApp(
    isDark: isDark,
  ));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key, this.isDark});
final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(create: (context) => AppCubit()..changeAppMode(fromShared: isDark)),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              SplashView.id: (context) => const SplashView(),
              OnBoardingView.id: (context) => const OnBoardingView(),
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
