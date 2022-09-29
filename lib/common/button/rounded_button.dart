import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.fontWeight,
      required this.fontSize,
      required this.color,
      required this.fonFamily})
      : super(key: key);

  final String title;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fonFamily;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: 'Montserrat'),
        ));
  }
}
