import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/string.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';
import 'package:game_pad/widgets/custom_text.dart';

class Connect extends StatelessWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Routes.instance.navigateTo(routeName: RouteNames.connect);
        },
        child: CustomText(
            title: StringValue.tvConnected,
            color: AppColor.green,
            fontFamily: 'Montserrat',
            fontSize: 5.sp));
  }
}
