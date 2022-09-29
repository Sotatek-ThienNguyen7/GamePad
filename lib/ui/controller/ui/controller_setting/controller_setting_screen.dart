import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/string.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';

import '../../../../common/button/rounded_button.dart';
import '../../../../resources/icons.dart';
import '../../../../widgets/common_dialog.dart';

class ControllerSettingScreen extends StatefulWidget {
  const ControllerSettingScreen({Key? key}) : super(key: key);

  @override
  State<ControllerSettingScreen> createState() =>
      _ControllerSettingScreenState();
}

class _ControllerSettingScreenState extends State<ControllerSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
      margin:  EdgeInsets.only(left: Platform.isIOS ? 36 :60, bottom: 15),
      child: Column(
        children: [
          itemController(
            leadingWidget: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AppIcons.back),
            ),
            title: 'Controller Settings',
            subTitle: 'Edit your controller settings',
            showTrailing: false,
            titleStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700),
            subTitleStyle: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      itemController(
                          leading: AppIcons.iconSleep,
                          title: 'Sleeping Time',
                          subTitle:
                          'The time the controller will stay on after it is no longer in use',
                          onTap: () {
                            Routes.instance.navigateTo(
                                routeName: RouteNames.sleepingTime);
                          }),
                      itemController(
                          leading: AppIcons.iconCalibration,
                          title: 'Calibration Sticks and Triggers',
                          subTitle:
                          'Make sure your controls are aligned and working correctly',
                          onTap: () {
                            Routes.instance.navigateTo(
                                routeName: RouteNames.sticksAndTriggers);
                          }),
                      itemController(
                          leading: AppIcons.iconLed,
                          title: 'Adjust LED Brightness',
                          subTitle: 'The brigtness of the buttons backlight',
                          onTap: () {
                            Routes.instance.navigateTo(
                                routeName: RouteNames.ledName);
                          }),
                      itemController(
                          leading: AppIcons.iconSub,
                          title: 'Change Controller Name',
                          subTitle: 'Manage you controller’s bluetooth name',
                          onTap: () {
                            Routes.instance.navigateTo(
                                routeName: RouteNames.controllerName);
                          }),
                    ],
                  ),
                ),
                Expanded(
                    child: SizedBox(
                        width: 235,
                        height: 141,
                        child: Image.asset(
                          AppIcons.buttonConfigImage,
                          fit: BoxFit.contain,
                        ))),
              ],
            ),
          ),
          Padding(
            padding: Platform.isIOS
                ? const EdgeInsets.only(left: 56)
                : const EdgeInsets.only(left: 0),
            child: Row(
              children: [
                SizedBox(
                  width: 350.h,
                  height: 32,
                  child: RoundedButton(
                    title: StringValue.tvTitleReset,
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(134, 82, 176, 0.5),
                    onPressed: () {
                      CommonShowDialog.showDialogCommon(
                        context,
                        titleText: StringValue.tvTitleReset,
                        contentText: StringValue.tvContentReset,
                        cancelButtonText: StringValue.tvCancel,
                        confirmButtonText: StringValue.tvReset,
                      );
                    },
                    fonFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 350.h,
                  height: 32,
                  child: RoundedButton(
                    title: StringValue.tvTitleUnpair,
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(134, 82, 176, 0.5),
                    onPressed: () {
                      CommonShowDialog.showDialogCommon(
                        context,
                        titleText: StringValue.tvTitleUnpair,
                        contentText: StringValue.tvContentUnpair,
                        cancelButtonText: StringValue.tvCancel,
                        confirmButtonText: StringValue.tvUnpair,
                      );
                    },
                    fonFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}