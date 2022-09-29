import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';

class ButtonConfigScreen extends StatelessWidget {
  const ButtonConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
        child: Column(
          children: [
            itemController(
              leadingWidget: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppIcons.back),
              ),
              title: 'Buttons Configuration',
              subTitle: 'Configure gamepad buttons',
              showTrailing: false,
              titleStyle: const TextStyle(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
              subTitleStyle: const TextStyle(
                  color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        itemController(
                            leading: AppIcons.buttonLayout,
                            title: 'Button Layout',
                            subTitle:
                                'Change the button on the gamepad to another function.',
                            onTap: () {
                              Routes.instance.navigateTo(
                                routeName: RouteNames.buttonLayout,);
                            }),
                        itemController(
                            leading: AppIcons.hapticSettings,
                            title: 'Haptic Settings',
                            subTitle:
                                'Vibration level when the buttons are pressed.',
                            onTap: () {
                              Routes.instance.navigateTo(
                                routeName: RouteNames.hapticSettings,);
                            }),
                        itemController(
                            leading: AppIcons.mouse,
                            title: 'Function Key 1: Mouse',
                            subWidget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _richText(
                                    label: 'Mouse cursor', title: 'L-stick'),
                                _richText(label: 'Left click', title: 'A'),
                                _richText(label: 'Right click', title: 'B'),
                                _richText(
                                    label: 'Wheel scrolling', title: 'R-stick'),
                                _richText(
                                    label: 'Wheel button click',
                                    title: 'press R-stick'),
                              ],
                            ),
                            onTap: () {
                              Routes.instance.navigateTo(
                                  routeName: RouteNames.mouse,);
                            }),
                        itemController(
                            leading: AppIcons.backButton,
                            title: 'Function Key 2: Back Button',
                            subTitle:
                                'Vibration level when the buttons are pressed.',
                            onTap: () {}),
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
                          )))
                ],
              ),
            ),
          ],
        ));
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
