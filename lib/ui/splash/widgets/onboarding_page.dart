import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/bluetooth/core/blue_util.dart';
import 'package:game_pad/router/router.dart';
import 'package:game_pad/resources/dimens.dart';
import 'package:game_pad/widgets/custom_text.dart';

import '../../../common/button/rounded_button.dart';
import '../../../resources/icons.dart';
import '../../../router/route_name.dart';
import '../../../router/router.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.titleCustom,
      required this.titleEnd,
      required this.noOfScreen,
      required this.onNextPressed,
      required this.isShowHide,
      required this.currentScreenNo})
      : super(key: key);

  final Image image;
  final String title;
  final String titleCustom;
  final String titleEnd;
  final int noOfScreen;
  final Function(int) onNextPressed;
  final int currentScreenNo;
  final bool? isShowHide;

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool selected = false;
  int? currentPage = 1;
  int? pageMax = 3;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        selected = !selected;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLastScreen = widget.currentScreenNo >= widget.noOfScreen - 1;
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: AppDimens.paddingLeft, top: AppDimens.paddingTop),
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                AppIcons.logo,
                height: 30.h,
                width: 30.h,
              ),
            )),
        AnimatedAlign(
          alignment: selected ? Alignment.topRight : Alignment.center,
          curve: Curves.easeInOut,
          duration: const Duration(seconds: 1),
          child: Padding(
            padding: EdgeInsets.only(right: AppDimens.paddingRight),
            child: TextButton(
                onPressed: () {
                  Routes.instance.navigateAndRemove(routeName: RouteNames.home);
                },
                child: CustomText(
                  title: 'SKIP',
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 6.sp,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 56),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 8.sp,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(text: widget.title),
                      TextSpan(
                          text: widget.titleCustom,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: widget.titleEnd),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                widget.image,
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: AppDimens.paddingLeft, bottom: 30),
          child: AnimatedAlign(
            alignment: selected ? Alignment.bottomLeft : Alignment.center,
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 9.sp,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  const TextSpan(text: 'Step '),
                  TextSpan(
                      text: '${widget.currentScreenNo + 1}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' of $pageMax'),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, bottom: 30),
          child: AnimatedAlign(
            alignment: selected ? Alignment.bottomRight : Alignment.center,
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: widget.isShowHide!,
                  child: SizedBox(
                    width: 100,
                    height: 32,
                    child: RoundedButton(
                      color: const Color.fromRGBO(134, 82, 176, 0.5),
                      title: "Back",
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w700,
                      onPressed: () {
                        widget.onNextPressed(widget.currentScreenNo - 1);
                      },
                      fonFamily: 'Montserrat',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: isLastScreen == true ? 249 : 100,
                  height: 32,
                  child: RoundedButton(
                    color: const Color.fromRGBO(0, 251, 183, 0.5),
                    title: isLastScreen == true
                        ? 'OPEN BLUETOOTH SETTINGS'
                        : 'NEXT',
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w700,
                    onPressed: () async {
                      if (isLastScreen == true) {
                        BluetoothUtil.instance.openBluetooth();
                      } else {
                        widget.onNextPressed(widget.currentScreenNo + 1);
                      }
                    },
                    fonFamily: 'Montserrat',
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
