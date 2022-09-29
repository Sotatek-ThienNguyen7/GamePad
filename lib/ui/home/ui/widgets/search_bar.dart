import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';

class SearchBar extends StatefulWidget {

  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with TickerProviderStateMixin {
  bool showSearch = false;
  late AnimationController controller;
  late Animation<double> myTween;

  @override
  void initState() {
    showSearch = false;
    super.initState();
    controller = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 1),
      // reverseDuration: const Duration(seconds: 1),
    );
    myTween = Tween<double>(begin: 1, end: 0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('show search  --- $showSearch');
    return SizedBox(
      height: 32,
      child: showSearch
          ? SizeTransition(
              sizeFactor: myTween,
              axis: Axis.horizontal,
              //to change size in the X direction
              axisAlignment: -1.0,
              //from the start to finish (left to right)
              // this value shrinks the black color and make it looks that the blue bar is moving to the right alignment
              child: Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 252,
                        child: TextFormField(
                          autofocus: true,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                          decoration: InputDecoration(
                            hintText: 'Call of duty',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                            prefix: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Opacity(
                                opacity: 0,
                                child: SvgPicture.asset(
                                  AppIcons.search,
                                ),
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 5),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            filled: true,
                            fillColor: AppColor.violet.withOpacity(0.2),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        top: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset(
                            AppIcons.search,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: IconButton(
                          onPressed: () {
                            FocusScopeNode currentScope =
                                FocusScope.of(context);
                            if (!currentScope.hasPrimaryFocus &&
                                currentScope.hasFocus) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                            // myTween = CurvedAnimation(
                            //   parent: controller,
                            //   curve: Curves.fastOutSlowIn,
                            // );
                            // controller.reverse();

                            setState(() {
                              showSearch = false;
                              controller.forward();
                            });
                          },
                          icon: SvgPicture.asset(
                            AppIcons.close,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.violet,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      onPressed: () {
                        Routes.instance.navigateTo(
                            routeName: RouteNames.search);
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            )
          : InkWell(
              onTap: () {
                print('11111111');
                setState(() {
                  showSearch = true;
                  controller.reverse();
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //.copyWith(left: 13, bottom: 6),
                child: SvgPicture.asset(
                  AppIcons.search,
                ),
              ),
            ),
    );
  }
}
