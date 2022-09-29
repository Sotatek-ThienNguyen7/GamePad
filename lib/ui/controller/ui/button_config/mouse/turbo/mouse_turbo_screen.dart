import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/widgets/button_cancel.dart';
import 'package:game_pad/widgets/checkbox_default.dart';

class MouseTurboScreen extends StatefulWidget {
  const MouseTurboScreen({Key? key}) : super(key: key);

  @override
  State<MouseTurboScreen> createState() => _MouseTurboScreenState();
}

class _MouseTurboScreenState extends State<MouseTurboScreen> {
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
                title: 'Turbo',
                subTitle:
                'While turbo set on (LED #2 on) by function key, turbo action can be activated by pressing the selected key longer',
                showTrailing: false,
                titleStyle: _textStyle,
                subTitleStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 24,),
            Container(
            padding:  EdgeInsets.only(left: Platform.isIOS?96:50),
              width: MediaQuery.of(context).size.width * 0.55,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxDefault(
                          value: false,
                          label: 'A',
                          onChanged: (value) {},
                        ),
                        CheckboxDefault(
                          value: true,
                          label: 'X',
                          onChanged: (value) {},
                        ),
                        CheckboxDefault(
                          value: true,
                          label: 'LB',
                          onChanged: (value) {},
                        ),
                        CheckboxDefault(
                          value: false,
                          label: 'LT',
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxDefault(
                          value: false,
                          label: 'B',
                          onChanged: (value) {},
                        ),
                        CheckboxDefault(
                          value: true,
                          label: 'Y',
                          onChanged: (value) {},
                        ),
                        CheckboxDefault(
                          value: false,
                          label: 'RB',
                          onChanged: (value) {},
                        ),
                        CheckboxDefault(
                          value: false,
                          label: 'RT',
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}