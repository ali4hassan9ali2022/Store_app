import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(InitialSplashState());
  void startSplash() async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(CartAppearSplashState());
    await Future.delayed(const Duration(milliseconds: 800));
    emit(CartPulseSplashState());
    await Future.delayed(const Duration(milliseconds: 800));
    emit(ProductsFlySplashState());
    await Future.delayed(const Duration(seconds: 1));
    emit(CompletedSplashState());
  }
}
