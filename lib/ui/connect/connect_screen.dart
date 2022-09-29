import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/widgets/common_dialog.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({Key? key}) : super(key: key);
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
        child: Column(
          children: [
            itemController(
              leading: AppIcons.iconController,
              title: 'Controller',
              showTrailing: false,
              titleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              subTitleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(left: 56),
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(14),
                          child: Text('No controller is connected.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                AppColor.violet.withOpacity(0.5),
                          ),
                          child: Text(
                            'Connect Your Controller'.toUpperCase(),
                            style: _textStyle,
                          ),
                          onPressed: () {
                            CommonShowDialog.showDialogCommon(context,
                                leading:
                                    SvgPicture.asset(AppIcons.disconnect),
                                titleText: 'Controller disconnected',
                                contentText:
                                    'The connection to the controller was lost. Please reconnect your controller.',
                                cancelButtonText: 'CLOSE',
                                confirmButtonText: 'RECONNECT',
                                subContent: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      CommonShowDialog.showDialogCommon(
                                        context,
                                        titleText:
                                            'Controller Troubleshooting',
                                        cancelButtonText: 'CLOSE',
                                        confirmButtonText: 'RECONNECT',
                                        subWidget: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _text(
                                                '1. Make sure your controller is powered-off'),
                                            _text(
                                                '2. Check that the mode switch is in the correct position for your OS'),
                                            _text(
                                                '3. Power the controller back on'),
                                            _text(
                                                '4. Check your device’s Bluetooth options'),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text.rich(
                                              TextSpan(children: [
                                                const TextSpan(
                                                    text:
                                                        'For more info, '),
                                                TextSpan(
                                                    text: 'tap here.',
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .greenLight,
                                                        fontWeight:
                                                            FontWeight
                                                                .w700)),
                                              ]),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        showConfirm: false,
                                      );
                                    },
                                    child: Text(
                                      'Controller Troubleshooting',
                                      style: TextStyle(
                                          color: AppColor.green2,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    )));
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                          width: 235,
                          height: 196,
                          child: Image.asset(
                            AppIcons.angleTwo,
                            fit: BoxFit.contain,
                          )))
                ],
              ),
            ),
          ],
        ));
  }

  Widget _text(title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
    );
  }
}
