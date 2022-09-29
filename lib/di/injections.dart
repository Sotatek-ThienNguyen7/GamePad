
import 'package:game_pad/common/blocs/alert/app_alert_cubit.dart';
import 'package:game_pad/common/blocs/loading/loading_cubit.dart';
import 'package:game_pad/repo/games_repo.dart';
import 'package:game_pad/ui/splash/onboarding/onboarding_cubit.dart';
import 'package:get_it/get_it.dart';
import '../ui/home/bloc/game_data_bloc.dart';
import '../ui/splash/splash/splash_cubit.dart';

final inject = GetIt.instance;

Future<void> init() async {
  _initializeCubit();
  _initializeRepositories();
}

void _initializeCubit() {
  inject.registerLazySingleton(() => LoadingCubit());
  inject.registerLazySingleton(() => AppAlertCubit());
  inject.registerLazySingleton(() => SplashCubit());
  inject.registerLazySingleton(() => GameDataBloc(GamesRepo()));
  inject.registerLazySingleton(() => OnBoardingCubit());
}

void _initializeRepositories() {

}