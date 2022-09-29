import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_pad/di/injections.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/splash/onboarding/onboarding_cubit.dart';
import 'package:game_pad/ui/splash/onboarding/onboarding_state.dart';

import '../widgets/onboarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);
  final OnBoardingCubit _cubit = inject<OnBoardingCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppIcons.backGround,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocListener<OnBoardingCubit, OnBoardingState>(
              bloc: _cubit,
              listener: (context, state) {
                final page = state.page ?? 0;
                controller.animateToPage(page,
                    duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
              },
              child: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  OnBoardingPage(
                    image: Image.asset(AppIcons.splash),
                    title: "Position the ",
                    titleCustom: "“Mode Switch”",
                    titleEnd: " to match your device",
                    noOfScreen: 3,
                    onNextPressed: _cubit.onNext,
                    currentScreenNo: 0,
                    isShowHide: false,
                  ),
                  OnBoardingPage(
                    image: Image.asset(
                      AppIcons.splashOne,
                      height: MediaQuery.of(context).size.height - 96,
                      fit: BoxFit.scaleDown,
                    ),
                    title: "Power ",
                    titleCustom: "ON ",
                    titleEnd: "the controller",
                    noOfScreen: 3,
                    onNextPressed: _cubit.onNext,
                    currentScreenNo: 1,
                    isShowHide: true,
                  ),
                  OnBoardingPage(
                    image: Image.asset(
                      AppIcons.splashTwo,
                      height: MediaQuery.of(context).size.height - 96,
                      fit: BoxFit.scaleDown,
                    ),
                    title: "Find the ",
                    titleCustom: 'GSPECS One ',
                    titleEnd: 'in your device’s Bluetooth Settings.',
                    noOfScreen: 3,
                    onNextPressed: _cubit.onNext,
                    currentScreenNo: 2,
                    isShowHide: true,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
