import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/ui/category/category_screen.dart';
import 'package:game_pad/ui/connect/connect_screen.dart';
import 'package:game_pad/ui/controller/ui/button_config/button_config_screen.dart';
import 'package:game_pad/ui/controller/ui/button_config/button_layout/button_layout_screen.dart';
import 'package:game_pad/ui/controller/ui/button_config/haptic_settings/haptic_settings_screen.dart';
import 'package:game_pad/ui/controller/ui/button_config/mouse/mouse_screen.dart';
import 'package:game_pad/ui/controller/ui/button_config/mouse/sniper/mouse_sniper_screen.dart';
import 'package:game_pad/ui/controller/ui/button_config/mouse/turbo/mouse_turbo_screen.dart';
import 'package:game_pad/ui/controller/ui/controller_screen.dart';
import 'package:game_pad/ui/controller/ui/controller_setting/controller_name/controller_name_screen.dart';
import 'package:game_pad/ui/controller/ui/controller_setting/controller_setting_screen.dart';
import 'package:game_pad/ui/controller/ui/controller_setting/led/led_screen.dart';
import 'package:game_pad/ui/controller/ui/controller_setting/sleeping_time/sleeping_time_screen.dart';
import 'package:game_pad/ui/controller/ui/controller_setting/sticks_and_triggers/left_button_calibration/left_button_calibration_screen.dart';
import 'package:game_pad/ui/controller/ui/controller_setting/sticks_and_triggers/sticks_and_triggers_screen.dart';
import 'package:game_pad/ui/controller/ui/controller_test/controller_test_screen.dart';
import 'package:game_pad/ui/help/ui/help_screen.dart';
import 'package:game_pad/ui/home/ui/detail/home_item_detail_screen.dart';
import 'package:game_pad/ui/home/ui/home_screen.dart';
import 'package:game_pad/ui/home/ui/search_result.dart';
import 'package:game_pad/ui/splash/next_splash/splash_next_screen.dart';
import 'package:game_pad/ui/splash/onboarding/onboarding_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../ui/controller/ui/button_chose/chose_button.dart';
import '../ui/splash/splash/splash_screen.dart';

class Routes {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory Routes() => _privateInstance;

  Routes._internal();

  static final Routes _privateInstance = Routes._internal();

  static Routes get instance => _privateInstance;

  /*
  * Navigate To
  * routeName: String
  * arguments: dynamic(dữ liệu để pass sang màn tiếp theo).
  * */
  Future<dynamic> navigateTo(
      {required String routeName, dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndRemove(
      {required String routeName, dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateAndReplace(
      {required String routeName, dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndReplaceName(
      {required String routeName, dynamic arguments}) async {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  dynamic pop({dynamic result}) {
    return navigatorKey.currentState?.pop(result);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RouteNames.splashScreen:
        return _pageRoute(page: const SplashScreen(), setting: settings);
      case RouteNames.nextSplashScreen:
        return _pageRoute(page: const SplashNextScreen(), setting: settings);
      case RouteNames.onBoarding:
        return _pageRoute(page: const OnBoardingScreen(), setting: settings);
      case RouteNames.home:
        return _pageRoute(page: const HomeScreen(), setting: settings);
      case RouteNames.controller:
        return _pageRoute(page: const ControllerScreen(), setting: settings);
      case RouteNames.help:
        return _pageRoute(page: const HelpScreen(), setting: settings);
      case RouteNames.categoryScreen:
        return _pageRoute(page: const CategoryScreen(), setting: settings);
      case RouteNames.controllerSetting:
        return _pageRoute(page: const ControllerSettingScreen(), setting: settings);
      case RouteNames.controllerTest:
        return _pageRoute(page: const ControllerTestScreen(), setting: settings);
      case RouteNames.buttonConfig:
        return _pageRoute(page: const ButtonConfigScreen(), setting: settings);
      case RouteNames.buttonLayout:
        return _pageRoute(page: const ButtonLayoutScreen(), setting: settings);
      case RouteNames.hapticSettings:
        return _pageRoute(page: const HapticSettingsScreen(), setting: settings);
      case RouteNames.mouse:
        return _pageRoute(page: const MouseScreen(), setting: settings);
      case RouteNames.mouseSniper:
        return _pageRoute(page: const MouseSniperScreen(), setting: settings);
      case RouteNames.mouseTurbo:
        return _pageRoute(page: const MouseTurboScreen(), setting: settings);
      case RouteNames.sleepingTime:
        return _pageRoute(page: const SleepingTimeScreen(), setting: settings);
      case RouteNames.sticksAndTriggers:
        return _pageRoute(page: const SticksAndTriggersScreen(), setting: settings);
      case RouteNames.controllerName:
        return _pageRoute(page: const ControllerNameScreen(), setting: settings);
      case RouteNames.ledName:
        return _pageRoute(page: const LedScreen(), setting: settings);
      case RouteNames.connect:
        return _pageRoute(page: const ConnectScreen(), setting: settings);
      case RouteNames.leftButtonCalibration:
        return _pageRoute(page: const LeftButtonCalibrationScreen(), setting: settings);
      case RouteNames.search:
        return _pageRoute(page: const SearchScreen(), setting: settings);
      case RouteNames.homeItemDetail:
        return _pageRoute(page: const HomeItemDetailScreen(), setting: settings);
      case RouteNames.choseButton:
        return _pageRoute(page: const ChoseButtonScreen(), setting: settings);
      default:
        return _pageRoute(page: const SplashScreen(), setting: settings);
    }
  }

  static PageTransition _pageRoute({
    PageTransitionType? transition,
    RouteSettings? setting,
    required Widget page,
  }) =>
      PageTransition(
        child: page,
        type: transition ?? PageTransitionType.fade,
        settings:
            RouteSettings(arguments: setting?.arguments, name: setting?.name),
        opaque: true
      );

  static MaterialPageRoute _emptyRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Container(
          color: Colors.black12,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 86.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      AppIcons.logo,
                    ),
                  )),
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 86, top: 130),
                          child: Column(
                            children: [
                              Text(
                                'Welcome to GSPECS ONE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 9.sp),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'ONE DEVICE. TOTAL CONTROL.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 8.sp),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(134, 82, 176, 0.5),
                                ),
                                onPressed: () {},
                                child: const Text('Add Controller'),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8.sp),
                                ),
                                onPressed: () {
                                  Routes.instance.navigateAndRemove(
                                      routeName: RouteNames.home);
                                },
                                child: const Text(
                                  'SKIP',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 48.0, bottom: 24.0),
                      child: Image.asset(AppIcons.angleTwo,
                          height: MediaQuery.of(context).size.height * 0.65.h,
                          width: MediaQuery.of(context).size.width * 0.6.h,
                          fit: BoxFit.scaleDown),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
