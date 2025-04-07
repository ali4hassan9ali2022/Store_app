import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Cubit/App_cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(IntialAppState()) {
    isDark = CacheHelper.getData(key: 'isDark') ?? false;
  }

  PageController pageController = PageController();
  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeAppStates());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        print('app mode changed to $isDark');
        emit(ChangeModeAppStates());
      });
    }
  }

  bool isLast = false;
  void lastPageView(int index) {
    isLast = (index == 2);
    emit(LastAppStates());
  }
}