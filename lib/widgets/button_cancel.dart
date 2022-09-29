import 'package:flutter/material.dart';
import 'package:game_pad/common/button/rounded_button.dart';
import 'package:game_pad/resources/colors.dart';

class ButtonCancel extends StatelessWidget {
  const ButtonCancel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 32,
      child: RoundedButton(
          title: 'CANCEL',
          onPressed: () => Navigator.pop(context),
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: const Color.fromRGBO(134, 82, 176, 0.5),
          fonFamily: 'Montserrat'),
    );
  }
}

class ButtonSave extends StatelessWidget {
  final VoidCallback? onTap;

  const ButtonSave({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 82,
      height: 32,
      child: RoundedButton(
          title: 'SAVE',
          onPressed: onTap!,
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: const Color.fromRGBO(90, 90, 90, 1),
          fonFamily: 'Montserrat'),
    );
  }
}

class ButtonReset extends StatelessWidget {
  final VoidCallback? onTap;

  const ButtonReset({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 143,
      height: 32,
      child: RoundedButton(
          title: 'Reset to Default',
          onPressed: onTap!,
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: const Color.fromRGBO(134, 82, 176, 0.5),
          fonFamily: 'Montserrat'),
    );
  }
}
