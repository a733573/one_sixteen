import 'dart:math' as math;
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class Board {
  Board() {
    newGame();
  }

  //final SettingsController settingsController = Get.find();

  final List<List<RxBool>> _isEnabledBoard = List.generate(
    SettingsController.to.boardSize,
    (_) => List.generate(SettingsController.to.boardSize, (_) => true.obs),
  );
  var _bombRow = 0;
  var _bombColumn = 0;

  bool isEnabled(int rowNum, int columnNum) =>
      _isEnabledBoard[rowNum][columnNum].value;

  bool isBombPos(int rowNum, int columnNum) =>
      _bombRow == rowNum && _bombColumn == columnNum;

  void newGame() {
    for (var rowNum = 0; rowNum < SettingsController.to.boardSize; rowNum++) {
      for (var columnNum = 0;
          columnNum < SettingsController.to.boardSize;
          columnNum++) {
        _isEnabledBoard[rowNum][columnNum].value = true;
      }
    }

    final bombNum = math.Random().nextInt(
      SettingsController.to.boardSize * SettingsController.to.boardSize,
    );
    _bombRow = bombNum ~/ SettingsController.to.boardSize;
    _bombColumn = bombNum % SettingsController.to.boardSize;
  }

  void push(int rowNum, int columnNum) =>
      _isEnabledBoard[rowNum][columnNum].value = false;
}
