import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxInt _buttonColorValue = Colors.red.value.obs;

  int get buttonColorValue => _buttonColorValue.value;

  set buttonColorValue(int value) => _buttonColorValue.value = value;

  Color get buttonColor => Color(_buttonColorValue.value);

  set buttonColor(Color color) => _buttonColorValue.value = color.value;
}
