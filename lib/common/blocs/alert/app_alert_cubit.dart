import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_pad/common/blocs/alert/app_alert_state.dart';

class AppAlertCubit extends Cubit<AppAlertState> {
  AppAlertCubit() : super(const AppAlertState());

  void showAlert({String? title, String? messages}) {
    emit(state);
  }
}