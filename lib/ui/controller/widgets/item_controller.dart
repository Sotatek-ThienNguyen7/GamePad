import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/colors.dart';
import '../../../resources/icons.dart';

Widget itemController({
  String? leading,
  String? title,
  String? subTitle,
  TextStyle? titleStyle,
  TextStyle? subTitleStyle,
  bool showTrailing = true,
  bool showDivider = true,
  Function()? onTap,
  Widget? subWidget,
  Widget? leadingWidget,
  Widget? trailing,
}) {
  return Column(
    children: [
      SizedBox(
        height: subWidget != null ? null : 50,
        child: ListTile(
          dense: true,
          onTap: onTap,
          minLeadingWidth: 32,
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: subWidget != null ? null : 15,
          leading: leadingWidget ??
              (leading != null ? SvgPicture.asset(leading) : null),
          title: Text(title ?? '',
              style: titleStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
          subtitle: subWidget ?? (subTitle != null ? Text(subTitle,
              style: subTitleStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400)):null)
              ,
          trailing:  trailing ?? (showTrailing ? SvgPicture.asset(AppIcons.right) : null),
        ),
      ),
      if(showDivider)
      Divider(
        color: AppColor.violet.withOpacity(0.2),
        height: 1,
      )
    ],
  );
}
