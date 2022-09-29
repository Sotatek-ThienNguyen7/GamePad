import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  const SplashState();
  
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashLoadedState extends SplashState {}