import 'package:flutter/material.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
        child: Row(
          children: [
            Expanded(
              child: ListView(
                children: [
                  itemController(
                    leading: AppIcons.iconController,
                    title: 'Controller',
                    subTitle: 'Configuration Menu',
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
                  itemController(
                      leading: AppIcons.buttonConfig,
                      title: 'Buttons Configuration',
                      subTitle: 'Configure gamepad buttons',
                      onTap: () {
                        Routes.instance.navigateTo(routeName: RouteNames.buttonConfig);
                      }),
                  itemController(
                      leading: AppIcons.controllerSettings,
                      title: 'Controller Settings',
                      subTitle: 'Edit controller settings',
                      onTap: () {
                        Routes.instance.navigateTo(
                            routeName: RouteNames.controllerSetting);
                      }),
                  itemController(
                      leading: AppIcons.controllerTest,
                      title: 'Controller Test',
                      subTitle: 'Test each key & button',
                      onTap: () {
                        Routes.instance.navigateTo(
                            routeName: RouteNames.controllerTest);
                      }),
                  itemController(
                      leading: AppIcons.firmwareUpdate,
                      title: 'Firmware Update',
                      subTitle: 'Update gamepad firmware',
                      onTap: () {}),
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
        ));
  }

}
