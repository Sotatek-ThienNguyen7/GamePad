import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/common/button/rounded_button.dart';

import '../../../../../resources/colors.dart';
import '../../../../../resources/icons.dart';
import '../../../../../widgets/common_dialog.dart';
import '../../../../../widgets/radio_group_default.dart';
import '../../controller_widget.dart';
import '../../../widgets/item_controller.dart';

class ControllerNameScreen extends StatefulWidget {
  const ControllerNameScreen({Key? key}) : super(key: key);

  @override
  State<ControllerNameScreen> createState() => _ControllerNameScreenState();
}

class _ControllerNameScreenState extends State<ControllerNameScreen> {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  late bool isCheckBtnReset = false;

  @override
  void initState() {
    isCheckBtnReset = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ControllerWidget(
      actionRights: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 100,
            height: 32,
            child: RoundedButton(
              title: 'CANCEL',
              fontSize: 6.sp,
              fontWeight: FontWeight.w700,
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color.fromRGBO(134, 82, 176, 0.5),
              fonFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          SizedBox(
            width: 82,
            height: 32,
            child: RoundedButton(
              title: 'SAVE',
              fontSize: 6.sp,
              fontWeight: FontWeight.w700,
              onPressed: () {},
              color: AppColor.grey1,
              fonFamily: 'Montserrat',
            ),
          ),
        ],
      ),
      actionsLeft: Visibility(
        visible: isCheckBtnReset,
        child: SizedBox(
          width: 145,
          height: 32,
          child: RoundedButton(
            title: 'Reset Default',
            fontSize: 6.sp,
            fontWeight: FontWeight.w700,
            onPressed: () {},
            color: const Color.fromRGBO(134, 82, 176, 0.5),
            fonFamily: 'Montserrat',
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: itemController(
                  showDivider: false,
                  leadingWidget: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(AppIcons.back),
                  ),
                  title: 'Change Controller Name',
                  subTitle: 'Manage you controller’s bluetooth name',
                  showTrailing: false,
                  titleStyle: _textStyle,
                  subTitleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Padding(
            padding: Platform.isIOS
                ? const EdgeInsets.only(left: 96)
                : const EdgeInsets.only(left: 50),
            child: _child(),
          ),
        ],
      ),
    );
  }

  Widget _child() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: RadioGroupDefault(
        groupValue: '0',
        onChanged: (value) {
          if (value == '3') {
            setState(() {
              isCheckBtnReset = true;
            });
            CommonShowDialog.showDialogCommon(context,
                titleText: 'Choose a custom name for your controller',
                contentText:
                'You can rename your controller within 30 characters. Only Alphabet letters, numbers and some symbols are allowed.',
                cancelButtonText: 'CANCEL',
                confirmButtonText: 'OK',
                subWidget: customTextField());
          }
        },
        listGroup: const [
          {
            '0': 'Default Value',
          },
          {
            '1': 'Xbox Wireless Controller',
          },
          {
            '2': 'Microsoft X-box 360 pad',
          },
          {
            '3': 'Custom',
          }
        ],
      ),
    );
  }

  Widget customTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: TextFormField(
        autofocus: false,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          hintText: 'Rename your controller',
          hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: const Color.fromRGBO(255, 255, 255, 0.5),
              fontWeight: FontWeight.w500),
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Opacity(
              opacity: 0,
              child: SvgPicture.asset(
                AppIcons.search,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          floatingLabelAlignment: FloatingLabelAlignment.center,
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
    );
  }
}
