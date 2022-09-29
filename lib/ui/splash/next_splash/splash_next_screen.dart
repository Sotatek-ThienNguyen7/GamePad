import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_pad/common/button/rounded_button.dart';
import 'package:game_pad/resources/dimens.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';
import 'package:game_pad/utils/spref_util.dart';
import 'package:game_pad/widgets/custom_text.dart';

import '../../../widgets/dialog_policy.dart';

class SplashNextScreen extends StatefulWidget {
  const SplashNextScreen({Key? key}) : super(key: key);

  @override
  State<SplashNextScreen> createState() => _SplashNextScreenState();
}

class _SplashNextScreenState extends State<SplashNextScreen> {
  bool selected = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        DialogPolicy.showDialogPolicy(context,
            titleText: 'Welcome to GSPECS App',
            cancelButtonText: 'DECLINE',
            confirmButtonText: 'I AGREE');
        selected = !selected;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppIcons.backGround,
          ),
        )),
        child: Padding(
          padding: EdgeInsets.only(top: AppDimens.paddingTop, left: 82),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: selected ? Alignment.topLeft : Alignment.center,
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 1),
                child: SvgPicture.asset(
                  AppIcons.logo,
                  height: 30.h,
                  width: 30.h,
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 100,
                bottom: 75,
                child: AnimatedAlign(
                  alignment: selected ? Alignment.centerLeft : Alignment.center,
                  curve: Curves.ease,
                  duration: const Duration(seconds: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        title: 'Welcome to GSPECS ONE',
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const CustomText(
                        title: 'ONE DEVICE. TOTAL CONTROL.',
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: AppDimens.paddingTop,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 211,
                            height: 32,
                            child: RoundedButton(
                              title: 'Add Controller',
                              fontSize: 6.sp,
                              fontWeight: FontWeight.w700,
                              onPressed: () {
                                Routes.instance.navigateAndRemove(
                                    routeName: RouteNames.onBoarding);
                                SPrefUtil.instance
                                    .setBool(GPKey.OPENED_OB, true);
                              },
                              color: const Color.fromRGBO(134, 82, 176, 0.5),
                              fonFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            onPressed: () {
                              Routes.instance.navigateAndRemove(
                                  routeName: RouteNames.home);
                              SPrefUtil.instance.setBool(GPKey.OPENED_OB, true);
                            },
                            child: Text(
                              'SKIP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
                                  fontSize: 6.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: AnimatedAlign(
                  alignment:
                      selected ? Alignment.centerRight : Alignment.bottomCenter,
                  curve: Curves.ease,
                  duration: const Duration(seconds: 1),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 58),
                    child: Image.asset(
                      AppIcons.gSpecAngle,
                      height: MediaQuery.of(context).size.width * 0.38,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
