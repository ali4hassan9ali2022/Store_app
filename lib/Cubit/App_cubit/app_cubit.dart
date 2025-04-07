import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Core/Cache/cache_helper.dart';
import 'package:store/Cubit/App_cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(IntialAppState());
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
}