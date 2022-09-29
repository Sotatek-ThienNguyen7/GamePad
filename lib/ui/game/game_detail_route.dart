import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_pad/di/injections.dart';
import 'package:game_pad/ui/home/ui/home_screen.dart';
import '../splash/splash/splash_cubit.dart';

class HomeRoute {
  static Widget get route => BlocProvider(
    create: (context) => inject<SplashCubit>(),
    child: const HomeScreen(),
  );
}