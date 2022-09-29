import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_pad/common/blocs/appbar/appbar_state.dart';

class AppbarCubit extends Cubit<AppbarState> {
  AppbarCubit():super(const AppbarState());
}