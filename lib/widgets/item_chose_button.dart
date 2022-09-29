import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/colors.dart';

import '../resources/icons.dart';

class ItemChoseButton extends StatefulWidget {
  final String? groupValue;
  final List? listGroup;
  final ValueChanged<String>? onChanged;

  const ItemChoseButton(
      {Key? key, this.groupValue, this.listGroup, this.onChanged})
      : super(key: key);

  @override
  State<ItemChoseButton> createState() => _ItemChoseButtonState();
}

class _ItemChoseButtonState extends State<ItemChoseButton> {
  String _groupValue = "";

  @override
  void initState() {
    _groupValue = widget.groupValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _radio(
                label: 'A',
                value: 'A',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'B',
                value: 'B',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'X',
                value: 'X',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'Y',
                value: 'Y',
                groupValue: _groupValue,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 70,
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _radio(
                label: 'LR',
                value: 'LR',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'RB',
                value: 'RB',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'LT',
                value: 'LT',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'RT',
                value: 'RT',
                groupValue: _groupValue,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 70,
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _radio(
                icon: SvgPicture.asset(AppIcons.logoOpenApp),
                label: 'Open App',
                value: 'Open App',
                groupValue: _groupValue,
              ),
              _radio(
                icon: SvgPicture.asset(AppIcons.playMenu),
                label: 'Menu',
                value: 'Menu',
                groupValue: _groupValue,
              ),
              _radio(
                icon: SvgPicture.asset(AppIcons.menu),
                label: 'My Games',
                value: 'My Games',
                groupValue: _groupValue,
              ),
              _radio(
                icon: SvgPicture.asset(AppIcons.myGame),
                label: 'My Games',
                value: 'My Games One',
                groupValue: _groupValue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _radio(
      {Widget? icon, String? label, String? value, String? groupValue}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (icon != null) icon,
        if (icon != null)
          const SizedBox(
            width: 10,
          ),
        Expanded(
          child: Text(
            label ?? '',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
          ),
        ),
        Theme(
          data: ThemeData(
            unselectedWidgetColor: AppColor.violet,
          ),
          child: Radio(
            value: value ?? '',
            groupValue: groupValue ?? '',
            activeColor: AppColor.greenLight,
            onChanged: (dynamic value) {
              setState(() {
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
                _groupValue = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
