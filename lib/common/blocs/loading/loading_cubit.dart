import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_pad/common/blocs/loading/loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit():super(const LoadingState());

  void show() {
    emit(state.copyWith(true));
  }

  void hide() {
    emit(state.copyWith(false));
  }

}