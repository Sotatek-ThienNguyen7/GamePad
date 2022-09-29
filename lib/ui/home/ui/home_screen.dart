import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/home/ui/widgets/item_categories.dart';
import 'package:game_pad/ui/home/ui/widgets/item_game.dart';
import 'package:game_pad/ui/home/ui/widgets/search_bar.dart';
import 'package:game_pad/widgets/drawer.dart';

import '../../../widgets/battery.dart';
import '../../../widgets/connect.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: Platform.isIOS?13.w:26.w,top: 100.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ItemGame(
                        title: 'Popular on GSpecs',
                        image: Image.asset(AppIcons.genShin),
                        strImage: AppIcons.callDuty,
                        strItem: 'Call Of Duty - Mobile',
                        iconItem: SvgPicture.asset(AppIcons.icStore),
                      ),
                      ItemGame(
                        title: 'Play for Free',
                        image: Image.asset(AppIcons.rectangle),
                        strImage: AppIcons.rectangle,
                        strItem: 'Fortnite',
                        iconItem: SvgPicture.asset(AppIcons.icStore),
                      ),
                      const ItemCategories(
                        title: 'Categories',
                        totalGame: 'Arcade',
                        categories: '21 games',
                      ),
                      ItemGame(
                        title: 'Xbox Cloud',
                        image: Image.asset(AppIcons.itemGame),
                        strImage: AppIcons.itemGame,
                        strItem: 'Call Of Duty - Black Ops',
                        iconItem: Image.asset(AppIcons.icXbox2),
                      ),
                      ItemGame(
                        title: 'PS Remote Play',
                        image: Image.asset(AppIcons.rectangle),
                        strImage: AppIcons.rectangle,
                        strItem: 'FIFA20',
                        iconItem: Image.asset(AppIcons.icRemotePlay2),
                      ),
                      ItemGame(
                        title: 'Steam Link',
                        image: Image.asset(AppIcons.itemGame),
                        strImage: AppIcons.itemGame,
                        strItem: 'World of Warcraft',
                        iconItem: Image.asset(AppIcons.icSteamLink2),
                      )
                    ],
                  ),
                ),
              ),
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
                        EdgeInsets.only(left: Platform.isIOS ? 27.w : 20.w),                        child: IconButton(
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
            ],
          ),
          drawer: const GameDrawer(),
        )
      ],
    );
  }
}
