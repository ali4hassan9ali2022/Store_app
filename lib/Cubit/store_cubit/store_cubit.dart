import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/store_cubit/store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(InitialStoreState());
}