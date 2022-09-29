import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/widgets/button_cancel.dart';
import 'package:game_pad/widgets/slider_default.dart';

class MouseSniperScreen extends StatefulWidget {
  const MouseSniperScreen({Key? key}) : super(key: key);

  @override
  State<MouseSniperScreen> createState() => _MouseSniperScreenState();
}

class _MouseSniperScreenState extends State<MouseSniperScreen> {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

  @override
  void initState() {
    super.initState();
  }

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
        actionsLeft: ButtonReset(
          onTap: () {},
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: itemController(
                showDivider: false,
                leadingWidget: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppIcons.back),
                ),
                title: 'Sniper',
                subTitle:
                    'While sniper set on (LED #2 on) by function key, L/R stick can control more precisely. Adjust the sensitivity of key control according to your gaming style.',
                showTrailing: false,
                titleStyle: _textStyle,
                subTitleStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              padding:  EdgeInsets.only(left: Platform.isIOS?96:50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SliderDefault(
                    axis: Axis.vertical,
                    divisions: 3,
                    progress: 100,
                    label: 'L-Stick sensitivity',
                    onChanged: (value) {},
                  ),
                  SliderDefault(
                    axis: Axis.vertical,
                    divisions: 3,
                    progress: 75,
                    label: 'R-Stick sensitivity',
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ));
  }
}
