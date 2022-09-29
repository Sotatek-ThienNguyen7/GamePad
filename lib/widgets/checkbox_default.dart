import 'package:flutter/material.dart';
import 'package:game_pad/resources/colors.dart';

class CheckboxDefault extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final String? label;
  final bool? value;
  const CheckboxDefault({
    Key? key,
    this.onChanged,
    this.label,
    this.value = false,
  }) : super(key: key);

  @override
  State<CheckboxDefault> createState() => _CheckboxDefaultState();
}

class _CheckboxDefaultState extends State<CheckboxDefault> {
  bool? _value;
  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CheckboxDefault oldWidget) {
    if (widget.value != oldWidget.value) {
      _value = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          widget.label ?? '',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
        )),
        Theme(
          data: ThemeData(
            unselectedWidgetColor: AppColor.violet,
          ),
          child: Checkbox(
            checkColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            value: _value,
            activeColor: AppColor.greenLight,
            onChanged: (value) {
              _value = value;
              if (widget.onChanged != null) {
                widget.onChanged!(value!);
              }
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
