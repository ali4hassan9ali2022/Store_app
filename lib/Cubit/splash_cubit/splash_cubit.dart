import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Cubit/splash_cubit/splash_state.dart';
import 'package:store/Helper/helper.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(InitialSplashState());
  void startSplash() async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(CartAppearSplashState());
    await Future.delayed(const Duration(milliseconds: 800));
    emit(CartPulseSplashState());
    await Future.delayed(const Duration(milliseconds: 800));
    emit(ProductsFlySplashState());
    await Future.delayed(const Duration(milliseconds: 800));
    emit(ShowTextSplashState());
    await Future.delayed(const Duration(seconds: 1));
    emit(CompletedSplashState());

    final bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
    Helper.token = CacheHelper.getData(key: 'token') ?? "";
    if (onBoarding == null) {
      emit(NavigateToOnBoadingSplashState());
    } else if (Helper.token.isEmpty) {
      emit(NavigateToLgonNiSplashState());
    } else {
      emit(NavigateToHomeLayOutSplashState());
    }
  }
}
