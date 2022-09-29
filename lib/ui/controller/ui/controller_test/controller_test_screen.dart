import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/widgets/custom_text.dart';

import '../../../../common/button/nav_button.dart';
import '../../../../widgets/slider_custom.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/icons.dart';

class ControllerTestScreen extends StatefulWidget {
  const ControllerTestScreen({Key? key}) : super(key: key);

  @override
  State<ControllerTestScreen> createState() => _ControllerTestScreenState();
}

class _ControllerTestScreenState extends State<ControllerTestScreen> {
  var value = 00.0;

  void onChanged(double _value) => setState(() => value = _value);

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
      padding: EdgeInsets.only(left: Platform.isIOS ? 36 : 60.0),
      margin: EdgeInsets.zero,
      child: ListView(
        children: [
          itemController(
            leadingWidget: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AppIcons.back),
            ),
            title: 'Controller Test',
            subTitle: 'Test each key and button',
            showTrailing: false,
            titleStyle: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
            subTitleStyle: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: Platform.isIOS
                ? const EdgeInsets.only(left: 56, top: 6, right: 24)
                : const EdgeInsets.only(left: 8, top: 6, right: 0),
            child: widgetTop(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widgetLeftStick(),
              widgetCircle(),
              widgetRightStick(),
              widgetButtonControl(),
            ],
          ),
          // widgetBottom(),
        ],
      ),
    );
  }

  Widget widgetTop() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: const Color.fromRGBO(8, 2, 23, 0.55),
            color: AppColor.violet4,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 158,
          height: 48,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SvgPicture.asset(AppIcons.icTestLeft),
                const Positioned(
                    top: 0,
                    left: 35,
                    child: CustomText(
                        title: 'Left Trigger 0%',
                        color: Colors.white,
                        fontFamily: '',
                        fontSize: 12)),
                Positioned(
                  top: 25,
                  left: 35,
                  child: SizedBox(
                    width: 100,
                    child: VerticalSlider(
                      onChanged: onChanged,
                      max: 100,
                      min: 0,
                      value: value,
                      width: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              // color: const Color.fromRGBO(8, 2, 23, 0.55),
              color: AppColor.violet4,
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset(AppIcons.icTestHome),
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              // color: const Color.fromRGBO(8, 2, 23, 0.55),
              color: AppColor.violet4,
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset(AppIcons.icTestHomes),
          ),
        ),
        const SizedBox(
          width: 196,
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              // color: const Color.fromRGBO(8, 2, 23, 0.55),
              color: AppColor.violet4,
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset(AppIcons.icTestPlay),
          ),
        ),
        const SizedBox(
          width: 70,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColor.violet4,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 158,
          height: 48,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
            child: Stack(
              children: [
                SvgPicture.asset(AppIcons.pullAndRelease),
                const Positioned(
                    top: 0,
                    left: 50,
                    child: CustomText(
                        title: 'Right Trigger 0%',
                        color: Colors.white,
                        fontFamily: '',
                        fontSize: 12)),
                Positioned(
                  top: 25,
                  left: 50,
                  child: SizedBox(
                    width: 100,
                    child: VerticalSlider(
                      onChanged: onChanged,
                      max: 100,
                      min: 0,
                      value: value,
                      width: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget widgetLeftStick() {
    return Padding(
      padding: Platform.isIOS
          ? const EdgeInsets.only(left: 56, top: 12)
          : const EdgeInsets.only(left: 8, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.violet4,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 96,
            height: 48,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: NavButton(label: 'LB', onTap: () {}),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
              // color: const Color.fromRGBO(8, 2, 23, 0.55),
              color: AppColor.violet4,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 158,
            height: 72,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
              child: Stack(
                children: [
                  SvgPicture.asset(AppIcons.imgCircleLeft),
                  Positioned(
                      top: 10,
                      left: 65,
                      child: CustomText(
                          title: 'Left Stick',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: '',
                          fontSize: 5.sp)),
                  Positioned(
                      top: 30,
                      left: 65,
                      child: Row(
                        children: [
                          CustomText(
                              title: '0.00',
                              color: Colors.white,
                              fontFamily: '',
                              fontSize: 5.sp),
                          const SizedBox(
                            width: 9,
                          ),
                          CustomText(
                              title: '0.00',
                              color: Colors.white,
                              fontFamily: '',
                              fontSize: 5.sp)
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetCircle() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 32),
      child: Container(
        width: 128,
        height: 128,
        decoration: BoxDecoration(
          // color: const Color.fromRGBO(8, 2, 23, 0.55),
          color: AppColor.violet4,
          borderRadius: BorderRadius.circular(128),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AppIcons.imgCircle),
        ),
      ),
    );
  }

  Widget widgetRightStick() {
    return Padding(
        padding: Platform.isIOS
            ? const EdgeInsets.only(left: 130, top: 12)
            : const EdgeInsets.only(left: 100, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: AppColor.violet4,
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset(AppIcons.icTestGame),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                // color: const Color.fromRGBO(8, 2, 23, 0.55),
                color: AppColor.violet4,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 158,
              height: 72,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
                child: Stack(
                  children: [
                    SvgPicture.asset(AppIcons.imgCircleLeft),
                    Positioned(
                        top: 10,
                        left: 65,
                        child: CustomText(
                            title: 'Right Stick',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: '',
                            fontSize: 5.sp)),
                    Positioned(
                        top: 30,
                        left: 65,
                        child: Row(
                          children: [
                            CustomText(
                                title: '0.00',
                                color: Colors.white,
                                fontFamily: '',
                                fontSize: 5.sp),
                            const SizedBox(
                              width: 9,
                            ),
                            CustomText(
                                title: '0.00',
                                color: Colors.white,
                                fontFamily: '',
                                fontSize: 5.sp)
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget widgetButtonControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 88, right: 24, top: 12),
          child: Container(
            decoration: BoxDecoration(
              // color: const Color.fromRGBO(8, 2, 23, 0.55),
              color: AppColor.violet4,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 96,
            height: 48,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: NavButton(label: 'RB', onTap: () {}),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 72, top: 12),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: AppColor.violet4,
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(AppIcons.icTestY),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 12),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: AppColor.violet4,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(AppIcons.icTestX),
                ),
              ),
              const SizedBox(
                width: 68,
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: AppColor.violet4,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(AppIcons.icTestB),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget widgetBottom() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 338, top: 12),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: AppColor.violet4,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(AppIcons.icTestF1),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 120, top: 12),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: AppColor.violet4,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(AppIcons.icTestF2),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 181, top: 12),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: AppColor.violet4,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(AppIcons.icTestA),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
