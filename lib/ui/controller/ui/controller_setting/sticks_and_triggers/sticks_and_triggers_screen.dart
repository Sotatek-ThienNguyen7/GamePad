import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/widgets/common_dialog.dart';

class SticksAndTriggersScreen extends StatefulWidget {
  const SticksAndTriggersScreen({Key? key}) : super(key: key);

  @override
  State<SticksAndTriggersScreen> createState() =>
      _SticksAndTriggersScreenState();
}

class _SticksAndTriggersScreenState extends State<SticksAndTriggersScreen> {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            itemController(
              leadingWidget: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppIcons.back),
              ),
              title: 'Calibration Sticks and Triggers',
              subTitle:
              'Make sure your controls are aligned and working correctly ',
              showTrailing: false,
              titleStyle: _textStyle,
              subTitleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
            _child(),
          ],
        ));
  }

  Widget _child() {
    return Container(
      padding: EdgeInsets.only(top: 15,left: Platform.isIOS ? 96 : 48, right: Platform.isIOS ? 96 : 48),

      width: MediaQuery.of(context).size.width * 0.5 ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'To start the Calibration process, put the controller down and select the trigger you want to calibrate. Follow the on screen indications.',
            style:
            _textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 48,
          ),
          Row(
            children: [
              const Spacer(),
              InkWell(
                  onTap: () {
                    CommonShowDialog.showDialogCommon(context,
                        titleText: 'Before Calibration',
                        contentText:
                        'Move stick to the leftmost, release, goes back to the center, then press START.',
                        leading: SvgPicture.asset(AppIcons.noLs),
                        cancelButtonText: 'CLOSE',
                        confirmButtonText: 'START',
                        onConfirm: (){
                          Navigator.pop(context);
                          Routes.instance.navigateTo(
                              routeName: RouteNames.leftButtonCalibration,arguments: {
                            'leftStick':'1'
                          });
                        }
                    );
                  },
                  child: SvgPicture.asset(AppIcons.lS)),
              const Spacer(),
              SvgPicture.asset(AppIcons.rS),
              const Spacer(flex: 2,),
              InkWell(
                  onTap: (){
                    CommonShowDialog.showDialogCommon(context,
                      titleText: 'Before Calibration ',
                      contentText:
                      'Pull and release the trigger slowly. When ready press START.',
                      leading: SvgPicture.asset(AppIcons.pullAndRelease),
                      cancelButtonText: 'CLOSE',
                      confirmButtonText: 'START',onConfirm: (){
                        Navigator.pop(context);
                        Routes.instance.navigateTo(
                            routeName: RouteNames.leftButtonCalibration,arguments: {
                          'leftTrigger':'1'
                        });
                      },);
                  },
                  child: SvgPicture.asset(AppIcons.lT)),
              const Spacer(),
              SvgPicture.asset(AppIcons.rT),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}