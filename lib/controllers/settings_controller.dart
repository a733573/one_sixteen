import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxInt _buttonColor = Colors.red.value.obs;

  Color get buttonColor => Color(_buttonColor.value);

  set buttonColor(Color color) => _buttonColor.value = color.value;
}
