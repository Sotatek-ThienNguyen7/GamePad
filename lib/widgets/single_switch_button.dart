import 'package:flutter/material.dart';
import 'package:game_pad/resources/colors.dart';

class SingleSwitchButton extends StatelessWidget {
  const SingleSwitchButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isActive = false,
  }) : super(key: key);
  final String label;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive == true ? null: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isActive == true ? AppColor.violet : Colors.transparent,
          borderRadius: isActive == true ?
               BorderRadius.circular(6)
              : null,
        ),
        width: 87,
        height: 32,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}