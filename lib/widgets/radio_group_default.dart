import 'package:flutter/material.dart';
import 'package:game_pad/resources/colors.dart';

class RadioGroupDefault extends StatefulWidget {
  final String? groupValue;
  final List<Map<String, dynamic>>? listGroup;
  final ValueChanged<String>? onChanged;

  const RadioGroupDefault(
      {Key? key, this.groupValue, this.listGroup, this.onChanged})
      : super(key: key);

  @override
  State<RadioGroupDefault> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroupDefault> {
  String _groupValue = "";

  @override
  void initState() {
    _groupValue = widget.groupValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.listGroup!.map((e) {
        return _radio(
          label: e.values.first,
          value: e.keys.first,
          groupValue: _groupValue,
        );
      }).toList(),
    );
  }

  Widget _radio({String? label, String? value, String? groupValue}) {
    return Row(
      children: [
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
