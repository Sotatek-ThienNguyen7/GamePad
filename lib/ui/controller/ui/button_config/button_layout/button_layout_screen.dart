import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/global.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/controller/ui/button_config/button_layout/widgets/button_layout_back.dart';
import 'package:game_pad/ui/controller/ui/button_config/button_layout/widgets/button_layout_left.dart';
import 'package:game_pad/ui/controller/ui/button_config/button_layout/widgets/button_layout_right.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/widgets/button_cancel.dart';
import 'package:game_pad/widgets/single_switch_button.dart';

enum SwitchType { left, right, back }

class ButtonLayoutScreen extends StatefulWidget {
  const ButtonLayoutScreen({Key? key}) : super(key: key);

  @override
  State<ButtonLayoutScreen> createState() => _ButtonLayoutScreenState();
}

class _ButtonLayoutScreenState extends State<ButtonLayoutScreen> {
  SwitchType type = SwitchType.right;
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
      showMargin: false,
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
      actionsLeft: Padding(
          padding: Platform.isIOS
              ? const EdgeInsets.only(left: 40)
              : const EdgeInsets.only(left: 0),
          child: ButtonReset(
            onTap: () {},
          )),
      child: Column(
        children: [
          Padding(
            padding: paddingLeft,
            child: Row(
              children: [
                Expanded(
                  child: itemController(
                    leadingWidget: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(AppIcons.back),
                    ),
                    title: 'Button Layout',
                    subTitle:
                        'Change the button on the gamepad to another function.',
                    showTrailing: false,
                    showDivider: false,
                    titleStyle: _textStyle,
                    subTitleStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.violet2),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SingleSwitchButton(
                        isActive: type == SwitchType.left,
                        label: 'Left',
                        onPressed: () {
                          setState(() {
                            type = SwitchType.left;
                          });
                        },
                      ),
                      SingleSwitchButton(
                        isActive: type == SwitchType.right,
                        label: 'Right',
                        onPressed: () {
                          setState(() {
                            type = SwitchType.right;
                          });
                        },
                      ),
                      SingleSwitchButton(
                        isActive: type == SwitchType.back,
                        label: 'Back',
                        onPressed: () {
                          setState(() {
                            type = SwitchType.back;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: _child(type),
          ),
        ],
      ),
    );
  }

  Widget _child(SwitchType type) {
    switch (type) {
      case SwitchType.left:
        return const ButtonLayoutLeft();
      case SwitchType.back:
        return const ButtonLayoutBack();
      case SwitchType.right:
      default:
        return const ButtonLayoutRight();
    }
  }
}
