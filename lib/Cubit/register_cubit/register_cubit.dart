import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Cubit/register_cubit/resgister_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() :super(RegisterInitialStates());
}
