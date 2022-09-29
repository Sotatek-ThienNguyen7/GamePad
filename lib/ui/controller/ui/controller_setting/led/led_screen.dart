import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/widgets/button_cancel.dart';

import '../../../../../resources/colors.dart';
import '../../../../../resources/icons.dart';
import '../../controller_widget.dart';
import '../../../widgets/item_controller.dart';

class LedScreen extends StatefulWidget {
  const LedScreen({Key? key}) : super(key: key);

  @override
  State<LedScreen> createState() => _LedScreenState();
}

class _LedScreenState extends State<LedScreen> {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  double _currentSliderValue = 60;

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
      margin: EdgeInsets.only(left: Platform.isIOS ? 36 :60, right: 56, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          itemController(
            leadingWidget: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AppIcons.back),
            ),
            title: 'Adjust LED Brightness',
            subTitle: 'The brightness of the backlight buttons',
            showTrailing: false,
            titleStyle: _textStyle,
            subTitleStyle: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.iconLedLeft),
              SizedBox(
                  width: 400,
                  child: Slider(
                    activeColor: AppColor.greenLight,
                    value: _currentSliderValue,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  )),
              SvgPicture.asset(AppIcons.iconLedRight),
            ],
          ),
          Row(
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
        ],
      ),
    );
  }
}