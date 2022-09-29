import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/global.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';
import 'package:game_pad/ui/controller/ui/button_config/mouse/radio_group.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/widgets/button_cancel.dart';
import 'package:game_pad/widgets/switch_default.dart';

class MouseScreen extends StatefulWidget {
  const MouseScreen({Key? key}) : super(key: key);

  @override
  State<MouseScreen> createState() => _MouseScreenState();
}

class _MouseScreenState extends State<MouseScreen> {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  String _groupValue = '';

  @override
  void initState() {
    _groupValue = 'mouse';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
        margin: marginLeft.copyWith(right: 24),
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
              title: 'Function Key 1',
              subTitle: 'Select your function key option',
              showTrailing: false,
              titleStyle: _textStyle,
              subTitleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: Platform.isIOS ? 96 : 48),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 5,
                    child: RadioGroup(
                      groupValue: _groupValue,
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value;
                        });
                      },
                      listGroup: const [
                        {'functionOFF': 'Function OFF'},
                        {'turbo': 'Turbo'},
                        {'sniper': 'Sniper'},
                        {'stickTransition': 'Stick Transition'},
                        {'volumeDown': 'Volume Down'},
                        {'volumeUp': 'Volume Up'},
                        {'phoneMedia': 'Phone Media'},
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: <Color>[
                            AppColor.black1,
                            AppColor.black1.withOpacity(0.55),
                          ],
                        ),
                      ),
                      child: _child(_groupValue),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(flex: 3,),
          ],
        ));
  }

  Widget _child(String groupValue) {
    switch (groupValue) {
      case 'sniper':
        return InkWell(
          onTap: () {
            Routes.instance.navigateTo(
              routeName: RouteNames.mouseSniper,);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Sniper Mode',
                        style: _textStyle.copyWith(fontSize: 12),
                      ),
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                          color: AppColor.greenLight,
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                Text('While sniper set on (LED #2 on) by function key, L/R stick can control more precisely. Adjust the sensitivity of key control according to your gaming style.',style: _textStyle.copyWith(fontSize: 10,fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        );
      case 'turbo':
        return InkWell(
          onTap: () {
            Routes.instance.navigateTo(
              routeName: RouteNames.mouseTurbo,);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                          'Turbo Mode',
                          style: _textStyle.copyWith(fontSize: 12),
                        )),
                    Text(
                      'Edit',
                      style: TextStyle(
                          color: AppColor.greenLight,
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                Text('While turbo set on (LED #2 on) by function key, turbo action can be activated by pressing the selected key longer',style: _textStyle.copyWith(fontSize: 10,fontWeight: FontWeight.w400),),
                _richText(label: 'Buttons: ', title: 'L-stickX, Y, LB'),
              ],
            ),
          ),
        );
      case 'stickTransition':
        return _buttonRight(
            title: 'Stick Transition',
            subTitle:
            'Switches the inputs of the L-Stick and Directional Pad (Dpad). ',
            onTap: () {});
      case 'volumeDown':
        return _buttonRight(
            title: 'Volume Down',
            subTitle: 'Turns down the volume of your device.',
            onTap: () {});
      case 'volumeUp':
        return _buttonRight(
            title: 'Volume Up',
            subTitle: 'Turns up the volume of your device.',
            onTap: () {});
      case 'phoneMedia':
        return _buttonRight(
            title: 'Phone Media',
            subTitle:
            'Play/Pause button for background media, and answer calls',
            onTap: () {});
      default:
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                  child: SwitchDefault(
                    label: Text(
                      'Enable Mouse Mode',
                      style: _textStyle.copyWith(fontSize: 12),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                _richText(label: 'Mouse cursor', title: 'L-stick'),
                _richText(label: 'Left click', title: 'A'),
                _richText(label: 'Right click', title: 'B'),
                _richText(label: 'Wheel scrolling', title: 'R-stick'),
                _richText(label: 'Wheel button click', title: 'press R-stick'),
              ],
            ),
          ),
        );
    }
  }

  Widget _buttonRight({String? title, String? subTitle, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title ?? '',
            style: _textStyle.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 8,),
          Text(
            subTitle ?? '',
            style:
            _textStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
          ),
        ]),
      ),
    );
  }

  Widget _richText({String? label, String? title}) {
    return RichText(
        text: TextSpan(children: [
          TextSpan(
              text: '${label ?? ''} : ',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400)),
          TextSpan(
              text: title ?? '',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700)),
        ]));
  }
}