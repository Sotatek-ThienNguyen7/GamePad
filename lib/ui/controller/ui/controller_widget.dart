import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/global.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/home/ui/widgets/search_bar.dart';
import 'package:game_pad/widgets/battery.dart';
import 'package:game_pad/widgets/connect.dart';
import 'package:game_pad/widgets/drawer.dart';

class ControllerWidget extends StatelessWidget {
  final Widget child;
  final Widget? actionsLeft;
  final Widget? actionRights;
  final bool showSearch;
  final bool showMargin;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  ControllerWidget({
    Key? key,
    required this.child,
    this.actionsLeft,
    this.actionRights,
    this.margin,
    this.padding,
    this.showSearch = false,
    this.showMargin = true,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          AppIcons.backGround,
        ),
      )),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Padding(
            padding: EdgeInsets.only(left: Platform.isIOS ? 36 : 60, right: 24),
            child: AppBar(
              leadingWidth: 32,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: SvgPicture.asset(AppIcons.iconMenu),
              ),
              centerTitle: false,
              title: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.logo,
                    height: 30.h,
                    width: 30.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  if (showSearch) const SearchBar()
                ],
              ),
              actions: [
                Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: const [
                        Connect(),
                        SizedBox(
                          width: 25,
                        ),
                        BatteryDefault(),
                      ],
                    )),
              ],
              titleSpacing: 16,
            ),
          ),
        ),
        key: _key,
        backgroundColor: Colors.transparent,
        drawer: const GameDrawer(),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: margin ?? (showMargin ? marginLeft : null),
              padding: padding,
              child: child,
            ),
            if (actionsLeft != null)
              Positioned(left: 78, bottom: 14, child: actionsLeft!),
            if (actionRights != null)
              Positioned(
                right: 24,
                bottom: 14,
                child: actionRights!,
              ),
            // Positioned(
            //     bottom: 0,
            //     left: 0,
            //     right: 0,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //           begin: Alignment.bottomCenter,
            //           end: Alignment.topCenter,
            //           colors: <Color>[
            //             AppColor.black1.withOpacity(0.7),
            //             AppColor.black1.withOpacity(0),
            //           ],
            //           tileMode: TileMode.mirror,
            //         ),
            //       ),
            //       width: MediaQuery.of(context).size.width,
            //       height: 53,
            //       child: Padding(
            //         padding: const EdgeInsets.only(bottom: 8),
            //         child: Align(
            //           alignment: Alignment.bottomCenter, // and
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(10)),
            //             width: 134,
            //             height: 5,
            //           ),
            //         ),
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }
}
