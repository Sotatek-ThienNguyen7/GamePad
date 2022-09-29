import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_pad/common/button/rounded_button.dart';
import 'package:game_pad/widgets/custom_text.dart';

import '../resources/colors.dart';

class DialogPolicy {
  static showDialogPolicy(
    BuildContext context, {
    required String titleText,
    required String cancelButtonText,
    required String confirmButtonText,
  }) {
    return showDialog(
      context: context,
      builder: (ctx) => Center(
        child: SizedBox(
          width: 490,
          height: 305,
          child: AlertDialog(
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            buttonPadding: const EdgeInsets.all(16),
            backgroundColor: AppColor.violet3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 8),
                  child: CustomText(
                    title: titleText,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Divider(
                  color: Color.fromRGBO(134, 82, 176, 0.2),
                  thickness: 1,
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                  children: [
                    const CustomText(
                      title:
                          'Thanks for using our products and services (“Services”). The Services are provided by Gamelancer Gaming Corp. (GMGN), a British Columbia corporation.',
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  'By using our Services, you are agreeing to these '),
                          TextSpan(
                              text: 'Terms of Use',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 251, 183, 1))),
                          TextSpan(text: ' and'),
                          TextSpan(
                              text: ' Privacy Policy',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 251, 183, 1))),
                          TextSpan(text: '. Please read them carefully.'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CustomText(
                      title:
                          'Our Services are very diverse, so sometimes additional terms or product requirements (including age requirements) may apply. Additional terms will be available with the relevant Services, and those additional terms become part of your agreement with us if you use those Services.',
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 98,
                      height: 32,
                      child: RoundedButton(
                          title: cancelButtonText,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          fontWeight: FontWeight.w700,
                          fontSize: 6.sp,
                          color: const Color.fromRGBO(134, 82, 176, 0.5),
                          fonFamily: 'Montserrat')),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                      width: 158,
                      height: 32,
                      child: RoundedButton(
                          title: confirmButtonText,
                          onPressed: () {},
                          fontWeight: FontWeight.w700,
                          fontSize: 6.sp,
                          color: const Color.fromRGBO(0, 251, 183, 0.5),
                          fonFamily: 'Montserrat')),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
