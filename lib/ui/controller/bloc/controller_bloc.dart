import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_pad/ui/controller/bloc/controller_event.dart';
import 'package:game_pad/ui/controller/bloc/controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  ControllerBloc() : super(ControllerInitial()) {
    ///
  }

}