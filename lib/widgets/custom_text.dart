import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final double fontSize;
  final String fontFamily;

  const CustomText(
      {Key? key,
      required this.title,
      required this.color,
      this.fontWeight,
      required this.fontFamily,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: fontFamily),
    );
  }
}
