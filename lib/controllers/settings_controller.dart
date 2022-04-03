import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxInt _buttonColorValue = Colors.red.value.obs;
  final RxInt _boardColorValue = Colors.grey.value.obs;
  final RxInt _boardSize = 4.obs;
  static SettingsController get to => Get.find();

  // ボタンの色
  int get buttonColorValue => _buttonColorValue.value;

  set buttonColorValue(int value) => _buttonColorValue.value = value;

  Color get buttonColor => Color(_buttonColorValue.value);

  set buttonColor(Color color) => _buttonColorValue.value = color.value;

  // ボードの色
  int get boardColorValue => _boardColorValue.value;

  set boardColorValue(int value) => _boardColorValue.value = value;

  Color get boardColor => Color(_boardColorValue.value);

  set boardColor(Color color) => _boardColorValue.value = color.value;

  // ボードサイズ
  int get boardSize => _boardSize.value;

  set boardSize(int value) => _boardSize.value = value;


}
