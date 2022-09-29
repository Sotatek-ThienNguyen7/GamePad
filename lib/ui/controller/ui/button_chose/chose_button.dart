import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/dimens.dart';

import '../../../../resources/icons.dart';
import '../../../../widgets/button_cancel.dart';
import '../../../../widgets/item_chose_button.dart';
import '../../widgets/item_controller.dart';
import '../controller_widget.dart';

class ChoseButtonScreen extends StatefulWidget {
  const ChoseButtonScreen({Key? key}) : super(key: key);

  @override
  State<ChoseButtonScreen> createState() => _ChoseButtonScreenState();
}

class _ChoseButtonScreenState extends State<ChoseButtonScreen> {
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
        actionRights: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const ButtonCancel(),
            const SizedBox(
              width: 8,
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
              title: 'A Button',
              subTitle: 'Choose a different button from the list',
              showTrailing: false,
              titleStyle: _textStyle,
              subTitleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Padding(
              padding: Platform.isIOS
                  ? EdgeInsets.only(left: AppDimens.childLeftIOS)
                  : EdgeInsets.only(left: AppDimens.childLeftAndroid),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: ItemChoseButton(
                      groupValue: _groupValue,
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value;
                        });
                      },
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Text(''),
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
