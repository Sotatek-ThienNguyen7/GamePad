import 'package:flutter/material.dart';
import 'package:game_pad/resources/colors.dart';

class RadioGroup extends StatefulWidget {
  final String? groupValue;
  final List? listGroup;
  final ValueChanged<String>? onChanged;

  const RadioGroup({Key? key, this.groupValue, this.listGroup, this.onChanged})
      : super(key: key);

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
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
          child: Column(
            children: [
              _radio(
                label: 'Function OFF',
                value: 'functionOFF',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'Turbo',
                value: 'turbo',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'Sniper',
                value: 'sniper',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'Mouse',
                value: 'mouse',
                groupValue: _groupValue,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 56,
        ),
        Expanded(
          child: Column(
            children: [
              _radio(
                label: 'Stick Transition',
                value: 'stickTransition',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'Volume Down',
                value: 'volumeDown',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'Volume Up',
                value: 'volumeUp',
                groupValue: _groupValue,
              ),
              _radio(
                label: 'Phone Media',
                value: 'phoneMedia',
                groupValue: _groupValue,
              ),
            ],
          ),
        ),
      ],
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
