import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final VoidCallback? onTap;
  final Color buttonColor;
  final double? width, height;
  final EdgeInsetsGeometry? padding;

  const NavButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.icon,
    this.buttonColor = Colors.white,
    this.height,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width ?? (1.sw) / 8,
          height: height ?? 25,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            border: Border.all(color: buttonColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[icon!, const SizedBox(width: 2)],
                AutoSizeText(
                  label,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: buttonColor,
                      ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  minFontSize: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
