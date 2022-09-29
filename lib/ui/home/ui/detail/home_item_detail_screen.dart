import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_pad/common/base/base_app.dart';
import 'package:game_pad/common/button/rounded_button.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';

class HomeItemDetailScreen extends StatelessWidget {
  const HomeItemDetailScreen({Key? key}) : super(key: key);
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return BaseApp(
        actionRights: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 143,
              height: 32,
              child: RoundedButton(
                  title: 'B to go Back',
                  onPressed: () {},
                  fontWeight: FontWeight.w700,
                  fontSize: 6.sp,
                  color: const Color.fromRGBO(134, 82, 176, 0.5),
                  fonFamily: 'Montserrat'),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 143,
              height: 32,
              child: RoundedButton(
                  title: 'A to Play',
                  onPressed: () {},
                  fontWeight: FontWeight.w700,
                  fontSize: 6.sp,
                  color: const Color.fromRGBO(0, 251, 183, 0.5),
                  fonFamily: 'Montserrat'),
            ),
          ],
        ),
        body: Container(
          margin: Platform.isIOS
              ? EdgeInsets.only(left: 36, top: 100.h, right: 24)
              : EdgeInsets.only(left: 26.w, top: 100.h, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _itemController(
                leadingWidget: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppIcons.back),
                ),
                title: 'Genshin Impact',
                showTrailing: false,
                titleStyle: _textStyle,
                subTitleStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                  margin:
                      Platform.isIOS ? const EdgeInsets.only(left: 48) : null,
                  child: _child()),
            ],
          ),
        ));
  }

  Widget _child() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 217,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 16,
                ); //16
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(AppIcons.rectangle),
                          fit: BoxFit.cover,
                        )),
                    constraints:
                        const BoxConstraints(maxWidth: 384, maxHeight: 217),
                  );
                }
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(AppIcons.rectangle),
                        fit: BoxFit.cover,
                      )),
                  constraints:
                      const BoxConstraints(maxWidth: 292, maxHeight: 164),
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                );
              }),
        ),
        const SizedBox(height: 24),
        const Text.rich(
          TextSpan(children: [
            TextSpan(text: 'Genre: '),
            TextSpan(
                text: 'Role-playing (RPG)',
                style: TextStyle(fontWeight: FontWeight.w800)),
          ]),
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Genshin Impact is an open-world action RPG, where you embark on a journey across Teyvat to find your lost sibling and seek answers from The Seven, the gods of each element. Explore this wondrous world, join forces with a diverse range of characters, and unravel the countless mysteries that Teyvat holds...',
          style: _textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Storyline',
          style: _textStyle,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Aeons ago, the elder elemental gods gave civilization to the human race, but the world soon splintered as corruption and greed grew without check. The gods watched from their abode in Celestia and selected the worthy to sit by their side and maintain the balance that hold the world together in one piece. The world is divided into culturally unique environs and themes. Delve into the ruins of a blasted empire that we... Read more',
          style: _textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Trailers and Screenshots',
          style: _textStyle,
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 217,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                ); //16
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Stack(
                    children: [
                      Container(
                        width: 384,
                        height: 217,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(AppIcons.rectangle))),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: <Color>[
                                  AppColor.black1,
                                  AppColor.black1.withOpacity(0.55),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 16),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Trailer',
                              style: _textStyle.copyWith(fontSize: 14),
                            ),
                          ))
                    ],
                  );
                }
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(AppIcons.rectangle),
                        fit: BoxFit.cover,
                      )),
                  constraints:
                      const BoxConstraints(maxWidth: 292, maxHeight: 164),
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                );
              }),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget _itemController({
    String? leading,
    String? title,
    String? subTitle,
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
    bool showTrailing = true,
    Function()? onTap,
    Widget? subWidget,
    Widget? leadingWidget,
  }) {
    return SizedBox(
      height: subWidget != null ? null : 50,
      child: ListTile(
        dense: true,
        onTap: onTap,
        minLeadingWidth: 32,
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: subWidget != null ? null : 15,
        leading: leadingWidget ??
            (leading != null ? SvgPicture.asset(leading) : null),
        title: Row(
          children: [
            Text(title ?? '',
                style: titleStyle ??
                    const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
            const SizedBox(
              width: 16,
            ),
            SvgPicture.asset(AppIcons.icAppstore)
          ],
        ),
        subtitle: subWidget ??
            (subTitle != null
                ? Text(subTitle,
                    style: subTitleStyle ??
                        const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w400))
                : null),
        trailing: showTrailing ? SvgPicture.asset(AppIcons.right) : null,
      ),
    );
  }
}
