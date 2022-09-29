import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/colors.dart';

class CommonShowDialog {
  static showDialogCommon(
    BuildContext context, {
    required String titleText,
    String? contentText,
    required String cancelButtonText,
    required String confirmButtonText,
    Widget? leading,
    Widget? subWidget,
    Widget? subContent,
    Function()? onConfirm,
    Function()? onCancel,
    bool? showConfirm = true,
  }) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColor.violet3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
        ),
        title: Container(
          constraints: const BoxConstraints(maxWidth: 414),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
              if (contentText != null)
                const SizedBox(
                  height: 20,
                ),
              if (contentText != null)
                (leading != null)
                    ? Row(
                        children: [
                          leading,
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contentText,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                if (subContent != null)
                                  const SizedBox(
                                    height: 12,
                                  ),
                                if (subContent != null) subContent
                              ],
                            ),
                          )
                        ],
                      )
                    : Text(
                        contentText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
              if (subWidget != null)
                const SizedBox(
                  height: 15,
                ),
              if (subWidget != null)
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 36,
                  ),
                  child: subWidget,
                )
            ],
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // width: 98,
              // height: 32,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(134, 82, 176, 0.5),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 24)),
                onPressed: onCancel ?? () => Navigator.of(context).pop(false),
                child: Text(
                  cancelButtonText,
                  style: TextStyle(
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            if (showConfirm == true)
              SizedBox(
                // width: 72,
                // height: 32,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 251, 183, 0.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24)),
                  onPressed:
                      onConfirm ?? () => Navigator.of(context).pop(false),
                  child: Text(
                    confirmButtonText,
                    style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                        color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }
}
