import 'package:flutter/material.dart';
import 'package:game_pad/app.dart';
import 'package:game_pad/setup.dart';

void main() async {
  await setup();
  runApp(const GPApp());
}
