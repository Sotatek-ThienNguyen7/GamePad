import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resources/string.dart';

class GameDrawer extends StatelessWidget {
  const GameDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(40, 36, 51, 1),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        child: ListView(
          padding: EdgeInsets.only(top: 4, left: Platform.isIOS ? 78 : 54),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    AppIcons.iconClose,
                    height: 72.h,
                    width: 72.h,
                  ),
                ),
                const SizedBox(width: 6),
                SvgPicture.asset(
                  AppIcons.logo,
                  height: 30.h,
                  width: 30.h,
                ),
              ],
            ),
            const SizedBox(height: 30),
            buildMenuItem(
                text: 'Controller',
                iconData: AppIcons.iconController,
                onClicked: () => selectedItem(context, 0)),
            const SizedBox(height: 15),
            buildMenuItem(
                text: 'Games',
                iconData: AppIcons.iconGame,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(height: 15),
            buildMenuItem(
                text: 'Help',
                iconData: AppIcons.iconHelp,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(height: 15),
            buildMenuItem(
                text: 'About',
                iconData: AppIcons.iconAbout,
                onClicked: () => selectedItem(context, 3)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text,
      required String iconData,
      VoidCallback? onClicked}) {
    return InkWell(
      onTap: onClicked,
      child: Row(
        children: [
          SvgPicture.asset(
            iconData,
            height: 82.h,
            width: 82.h,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 7.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        return Routes.instance
            .navigateAndRemove(routeName: RouteNames.controller);
      case 1:
        return Routes.instance.navigateAndRemove(routeName: RouteNames.home);
      case 2:
        return Routes.instance.navigateAndRemove(routeName: RouteNames.help);
      case 3:
        log('about');
        return _launchUrl();
      default:
        return;
    }
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(StringValue.url)) {
      throw 'Could not launch ${StringValue.url}';
    }
  }
}
