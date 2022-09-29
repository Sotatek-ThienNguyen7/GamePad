import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/colors.dart';
import '../../resources/icons.dart';
import '../../ui/home/ui/widgets/search_bar.dart';
import '../../widgets/battery.dart';
import '../../widgets/connect.dart';
import '../../widgets/drawer.dart';

class BaseApp extends StatefulWidget {
  final Widget body;
  final Widget? actionRights;

  const BaseApp({
    Key? key,
    required this.body,
    this.actionRights,
  }) : super(key: key);

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppIcons.backGround,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          key: _key,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SingleChildScrollView(child: widget.body),
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          AppColor.black1,
                          AppColor.black1.withOpacity(0),
                        ],
                      ),
                    ),
                    height: 77,
                    child: AppBar(
                      leadingWidth: Platform.isIOS ? 50.w : 45.w,
                      backgroundColor: Colors.transparent,
                      leading: Padding(
                        padding:
                            EdgeInsets.only(left: Platform.isIOS ? 27.w : 20.w),
                        child: IconButton(
                          icon: const Icon(Icons.menu),
                          color: Colors.deepPurple,
                          onPressed: () {
                            _key.currentState!.openDrawer();
                          },
                        ),
                      ),
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
                          const SearchBar()
                        ],
                      ),
                      actions: [
                        Container(
                            margin: const EdgeInsets.only(right: 24),
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
                      primary: false,
                      titleSpacing: 0,
                    ),
                  )),
              if (widget.actionRights != null)
                Positioned(
                  right: 24,
                  bottom: 14,
                  child: widget.actionRights!,
                ),
            ],
          ),
          drawer: const GameDrawer(),
        )
      ],
    );
  }
}
