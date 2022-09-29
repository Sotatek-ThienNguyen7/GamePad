import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/dimens.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/widgets/button_cancel.dart';
import 'package:game_pad/widgets/slider_default.dart';
import 'package:game_pad/widgets/switch_default.dart';

class HapticSettingsScreen extends StatefulWidget {
  const HapticSettingsScreen({Key? key}) : super(key: key);

  @override
  State<HapticSettingsScreen> createState() => _HapticSettingsScreenState();
}

class _HapticSettingsScreenState extends State<HapticSettingsScreen> {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
      actionsLeft: Padding(
          padding: Platform.isIOS
              ? EdgeInsets.only(left: AppDimens.buttonLeft)
              : EdgeInsets.only(left: AppDimens.paddingZero),
          child: ButtonReset(
            onTap: () {},
          )),
      actionRights: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const ButtonCancel(),
          const SizedBox(
            width: 11,
          ),
          ButtonSave(
            onTap: () {},
          ),
        ],
      ),
      child: Column(
        children: [
          itemController(
            leadingWidget: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AppIcons.back),
            ),
            title: 'Haptic Settings',
            subTitle: 'Vibration leven when the buttons are pressed',
            showTrailing: false,
            titleStyle: _textStyle,
            subTitleStyle: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700),
          ),
          _child(),
        ],
      ),
    );
  }

  Widget _child() {
    return Padding(
      padding: EdgeInsets.only(
          left: Platform.isIOS
              ? AppDimens.childLeftIOS
              : AppDimens.childLeftAndroid,
          right: Platform.isIOS
              ? AppDimens.childLeftIOS
              : AppDimens.childLeftAndroid),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SliderDefault(
                  progress: 50,
                  label: 'A',
                  onChanged: (value) {},
                ),
                SliderDefault(
                  progress: 50,
                  label: 'B',
                  onChanged: (value) {},
                ),
                SliderDefault(
                  progress: 50,
                  label: 'X',
                  onChanged: (value) {},
                ),
                SliderDefault(
                  progress: 50,
                  label: 'Y',
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 56,
          ),
          Expanded(
            child: Column(
              children: [
                SliderDefault(
                  progress: 50,
                  label: 'LB',
                  onChanged: (value) {},
                ),
                SliderDefault(
                  progress: 50,
                  label: 'RB',
                  onChanged: (value) {},
                ),
                SwitchDefault(
                  value: false,
                  label:
                      _richText(label: 'LT', title: '(Responsive Vibration)'),
                  onChanged: (value) {},
                ),
                SwitchDefault(
                  value: false,
                  label:
                      _richText(label: 'RT', title: '(Responsive Vibration)'),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _richText({String? label, String? title}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '${label ?? ''} : ',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
      TextSpan(
          text: title ?? '',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
    ]));
  }
}
