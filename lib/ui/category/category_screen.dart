import 'dart:io' show Platform; //at the top

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/common/base/base_app.dart';
import 'package:game_pad/resources/global.dart';

import '../../resources/colors.dart';
import '../../resources/icons.dart';
import '../../router/router.dart';
import '../../widgets/battery.dart';
import '../../widgets/connect.dart';
import '../../widgets/drawer.dart';
import '../../widgets/dropdown_custom.dart';
import '../controller/ui/controller_widget.dart';
import '../controller/widgets/item_controller.dart';
import '../home/ui/widgets/item_categories.dart';
import '../home/ui/widgets/item_game.dart';
import '../home/ui/widgets/search_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  final List<PhotoItem> _items = [
    PhotoItem(
        "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Liam Gant"),
    PhotoItem(
        "https://images.pexels.com/photos/1130847/pexels-photo-1130847.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Stephan Seeber"),
    PhotoItem(
        "https://images.pexels.com/photos/45900/landscape-scotland-isle-of-skye-old-man-of-storr-45900.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Pixabay"),
    PhotoItem(
        "https://images.pexels.com/photos/165779/pexels-photo-165779.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Scott Webb"),
    PhotoItem(
        "https://images.pexels.com/photos/548264/pexels-photo-548264.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Krivec Ales"),
    PhotoItem(
        "https://images.pexels.com/photos/188973/matterhorn-alpine-zermatt-mountains-188973.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Pixabay"),
    PhotoItem(
        "https://images.pexels.com/photos/795188/pexels-photo-795188.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Melanie Wupper"),
    PhotoItem(
        "https://images.pexels.com/photos/5222/snow-mountains-forest-winter.jpg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Jaymantri"),
    PhotoItem(
        "https://images.pexels.com/photos/789381/pexels-photo-789381.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Riciardus"),
    PhotoItem(
        "https://images.pexels.com/photos/326119/pexels-photo-326119.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Pixabay"),
    PhotoItem(
        "https://images.pexels.com/photos/707344/pexels-photo-707344.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Eberhard"),
    PhotoItem(
        "https://images.pexels.com/photos/691034/pexels-photo-691034.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Mirsad Mujanovic"),
    PhotoItem(
        "https://images.pexels.com/photos/655676/pexels-photo-655676.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Vittorio Staffolani"),
    PhotoItem(
        "https://images.pexels.com/photos/592941/pexels-photo-592941.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=150&w=200",
        "Tobi"),
  ];

  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return BaseApp(
        body: Container(
          margin: Platform.isIOS
              ? EdgeInsets.only(left: 36, top: 100.h, right: 24)
              : EdgeInsets.only(left: 26.w, top: 100.h, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              itemController(
                leadingWidget: InkWell(
                  onTap: () {
                    Routes.instance.pop();
                  },
                  child: SvgPicture.asset(AppIcons.back),
                ),
                title: 'Action and Adventure',
                subTitle: 'Browse among an ever updating games library',
                showTrailing: false,
                titleStyle: _textStyle,
                subTitleStyle: const TextStyle(
                    color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: Platform.isIOS ? 48 : 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 205,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: _textStyle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownCustom(
                            items: const {
                              '1': 'Action and Adventure',
                              '2': 'Arcade ',
                              '3': 'Puzzle ',
                              '4': 'Strategy ',
                            },
                            onChanged: (onChangedValue) {},
                            value: '1',
                            haveBorder: false,
                            title: 'Category',
                            showUp: false,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    SizedBox(
                      width: 142,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sort by:',
                            style: _textStyle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownCustom(
                            items: const {'1': 'Relevance', '2': 'Relevance 2'},
                            onChanged: (onChangedValue) {},
                            value: '1',
                            haveBorder: false,
                            title: 'Sort by',
                            showUp: false,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    SizedBox(
                      width: 142,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Platform:',
                            style: _textStyle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownCustom(
                            items: const {'1': 'All', '2': 'All 2'},
                            onChanged: (onChangedValue) {},
                            value: '1',
                            haveBorder: false,
                            title: 'Sort by',
                            showUp: false,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: Platform.isIOS ? 48 : 0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 16,
                        crossAxisCount: 4,
                        mainAxisExtent: Platform.isIOS ? 130 : 120),
                    itemCount: _items.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(_items[index].image),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
    );
  }
}

class PhotoItem {
  final String image;
  final String name;

  PhotoItem(this.image, this.name);
}
