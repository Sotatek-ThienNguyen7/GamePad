import 'package:flutter/material.dart';
import 'package:game_pad/resources/colors.dart';

class SwitchDefault extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Widget? label;
  const SwitchDefault({Key? key, this.value = false, this.onChanged, this.label})
      : super(key: key);

  @override
  State<SwitchDefault> createState() => _SwitchDefaultState();
}

class _SwitchDefaultState extends State<SwitchDefault> {
  bool? _value;
  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }
  @override
  void didUpdateWidget(covariant SwitchDefault oldWidget) {
    if(widget.value != oldWidget.value){
      _value = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: widget.label??const SizedBox()),
        Switch(
          value: _value!,
          activeColor: AppColor.violet,
          thumbColor: MaterialStateProperty.all(AppColor.violet,),
          inactiveTrackColor: AppColor.grey2,
          onChanged: (value) {
            _value = value;
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
            setState(() {
            });
          },
        ),
      ],
    );
  }
}
