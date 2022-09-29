import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io' show Platform;
import 'package:game_pad/widgets/custom_text.dart';
import '../../../../router/route_name.dart';
import '../../../../router/router.dart'; //at the top

class ItemCategories extends StatefulWidget {
  final String title;
  final String categories;
  final String totalGame;

  const ItemCategories(
      {Key? key,
      required this.title,
      required this.categories,
      required this.totalGame})
      : super(key: key);

  @override
  State<ItemCategories> createState() => _ItemCategoriesState();
}

class _ItemCategoriesState extends State<ItemCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: Platform.isIOS
                ? const EdgeInsets.only(left: 56, right: 24)
                : const EdgeInsets.only(right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 7.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          margin: EdgeInsets.only(left: Platform.isIOS ? 54 : 0),
          constraints: const BoxConstraints(maxHeight: 134),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Routes.instance
                        .navigateTo(routeName: RouteNames.categoryScreen);
                  },
                  child: index == 0
                      ? Container(
                          width: 238,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(93, 70, 144, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ItemCategoryCard(
                            categories: widget.categories,
                            totalGame: widget.totalGame,
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.all(4),
                          width: 180,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(86, 78, 105, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ItemCategoryCard(
                            categories: widget.categories,
                            totalGame: widget.totalGame,
                          ),
                        ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return index == 0
                  ? const SizedBox(
                      width: 4,
                    )
                  : const SizedBox(
                      width: 0,
                    );
            },
          ),
        ),
      ],
    );
  }
}

class ItemCategoryCard extends StatelessWidget {
  final String categories;
  final String totalGame;

  const ItemCategoryCard(
      {Key? key, required this.categories, required this.totalGame})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 70,
          left: 30,
          child: CustomText(
              title: categories,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
              fontSize: 6.sp),
        ),
        const SizedBox(
          height: 8,
        ),
        Positioned(
          top: 30,
          left: 30,
          child: CustomText(
              title: totalGame,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
              fontSize: 8.sp),
        ),
      ],
    );
  }
}
