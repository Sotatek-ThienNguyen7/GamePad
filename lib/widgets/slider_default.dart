import 'package:flutter/material.dart';
import 'package:game_pad/resources/colors.dart';

class SliderDefault extends StatefulWidget {
  final double progress;
  final ValueChanged<double>? onChanged;
  final String? label;
  final int? divisions;
  final Axis axis;

  const SliderDefault(
      {Key? key,
      this.progress = 0,
      this.onChanged,
      this.label,
      this.divisions,
      this.axis = Axis.horizontal})
      : super(key: key);

  @override
  State<SliderDefault> createState() => _SliderDefaultState();
}

class _SliderDefaultState extends State<SliderDefault> {
  double? _progress;

  @override
  void initState() {
    _progress = widget.progress;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SliderDefault oldWidget) {
    if (widget.progress != oldWidget.progress) {
      _progress = widget.progress;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.axis == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? '',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 6,
            ),
            child: Slider(
              divisions: widget.divisions,
              activeColor: AppColor.greenLight,
              inactiveColor: AppColor.violet.withOpacity(0.2),
              value: _progress ?? 0,
              label: '$_progress',
              min: 0.0,
              max: 100.0,
              onChanged: (value) {
                _progress = value.roundToDouble();
                if (widget.onChanged != null) {
                  widget.onChanged!(_progress!);
                }
                setState(() {});
              },
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Text(
            widget.label ?? '',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6,
              ),
              child: Slider(
                divisions: widget.divisions,
                activeColor: AppColor.greenLight,
                inactiveColor: AppColor.violet.withOpacity(0.2),
                value: _progress ?? 0,
                label: '$_progress',
                min: 0.0,
                max: 100.0,
                onChanged: (value) {
                  _progress = value.roundToDouble();
                  if (widget.onChanged != null) {
                    widget.onChanged!(_progress!);
                  }
                  setState(() {});
                },
              ),
            ),
          ),
          Text(
            '${_progress!.toInt()}',
            style: TextStyle(
                color: AppColor.greenLight,
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
        ],
      );
    }
  }
}
