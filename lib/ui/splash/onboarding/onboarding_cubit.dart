import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_pad/ui/splash/onboarding/onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit():super(const OnBoardingState());

  void onNext(int page) {
    emit(state.copyWith(page: page));
  }
}