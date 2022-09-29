import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/router/router.dart';
import 'package:game_pad/utils/spref_util.dart';

import '../../../resources/icons.dart';
import '../../../router/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final _animationController = AnimationController(
      vsync: this, duration: const Duration(seconds: 2), value: 1.0);

  @override
  void initState() {
    _animationController.animateTo(0.5);
    _animationController.addStatusListener((status) async {
        if(status == AnimationStatus.completed) {
          final isOpen = await SPrefUtil.instance.getBool(GPKey.OPENED_OB) ?? false;
          if (isOpen) {
            Routes.instance.navigateAndRemove(routeName: RouteNames.home);
          } else {
            Routes.instance.navigateAndRemove(routeName: RouteNames.nextSplashScreen);
          }
        }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
        Center(
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext _, child) {
                return Transform.scale(
                  scale: _animationController.value,
                  child: SvgPicture.asset(AppIcons.logo,
                      width: 320.w * _animationController.value,
                      height: 132.w * _animationController.value),
                );
              }),
        )
      ],
    );
  }
}
