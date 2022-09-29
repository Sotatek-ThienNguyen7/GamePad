library flutter_vertical_slider;

import 'package:flutter/material.dart';

class VerticalSlider extends StatelessWidget {
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final double value;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final double? width;

  const VerticalSlider({
    Key? key,
    required this.onChanged,
    required this.min,
    required this.max,
    required this.value,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: activeTrackColor,
        inactiveTrackColor: inactiveTrackColor,
        thumbColor: Colors.transparent,
        overlayColor: Colors.transparent,
        thumbSelector:
            (textDirection, values, tapValue, thumbSize, trackSize, dx) =>
                Thumb.start,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 1,
          elevation: 0.0,
        ),
        trackHeight: width,
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 1),
      ),
      child: Slider(
        onChanged: onChanged,
        min: min,
        max: max,
        value: value,
      ),
    );
  }
}
