import 'package:equatable/equatable.dart';

abstract class ControllerState extends Equatable {
  const ControllerState();

  @override
  List<Object> get props => [];
}

class ControllerInitial extends ControllerState {}

class ControllerLoadingState extends ControllerState {}

class ControllerLoadedState extends ControllerState {}
