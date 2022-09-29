import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/widgets/button_cancel.dart';
import 'package:game_pad/widgets/radio_group_default.dart';

class SleepingTimeScreen extends StatefulWidget {
  const SleepingTimeScreen({Key? key}) : super(key: key);

  @override
  State<SleepingTimeScreen> createState() => _SleepingTimeScreenState();
}

class _SleepingTimeScreenState extends State<SleepingTimeScreen> {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            itemController(
              leadingWidget: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppIcons.back),
              ),
              title: 'Sleeping Time',
              subTitle: 'The time the controller will stay on after it is no longer in use',
              showTrailing: false,
              titleStyle: _textStyle,
              subTitleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.only(left: Platform.isIOS ? 96 : 48, right: Platform.isIOS ? 96 : 48),
              child: _child(),
            ),
          ],
        )
    );
  }

  Widget _child() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: const RadioGroupDefault(
        groupValue: '60',
        listGroup: [
          {
            '0': 'No timer',
          },
          {
            '15': '15 minutes',
          },
          {
            '30': '30 minutes',
          },
          {
            '60': '60 minutes',
          }
        ],
      ),
    );
  }
}