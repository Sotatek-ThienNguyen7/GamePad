import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/common/base/base_app.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/home/ui/widgets/item_categories.dart';
import 'package:game_pad/ui/home/ui/widgets/item_game.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseApp(
        body: Container(
          margin: EdgeInsets.only(left: Platform.isIOS ? 13.w : 26.w, top: 100.h),
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
              // ItemGame(
              //   title: 'Play for Free',
              //   image: Image.asset(AppIcons.rectangle),
              //   strImage: AppIcons.rectangle,
              //   strItem: 'Fortnite',
              //   iconItem: SvgPicture.asset(AppIcons.icStore),
              // ),
              const ItemCategories(
                title: 'Categories',
                totalGame: 'Arcade',
                categories: '21 games',
              ),
              // ItemGame(
              //   title: 'Xbox Cloud',
              //   image: Image.asset(AppIcons.itemGame),
              //   strImage: AppIcons.itemGame,
              //   strItem: 'Call Of Duty - Black Ops',
              //   iconItem: Image.asset(AppIcons.icXbox2),
              // ),
              // ItemGame(
              //   title: 'PS Remote Play',
              //   image: Image.asset(AppIcons.rectangle),
              //   strImage: AppIcons.rectangle,
              //   strItem: 'FIFA20',
              //   iconItem: Image.asset(AppIcons.icRemotePlay2),
              // ),
              // ItemGame(
              //   title: 'Steam Link',
              //   image: Image.asset(AppIcons.itemGame),
              //   strImage: AppIcons.itemGame,
              //   strItem: 'World of Warcraft',
              //   iconItem: Image.asset(AppIcons.icSteamLink2),
              // )
            ],
          ),
    ));
  }
}
