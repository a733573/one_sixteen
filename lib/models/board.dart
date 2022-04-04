import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:one_sixteen/controllers/game_controller.dart';

import '../controllers/settings_controller.dart';

class Board {
  Board() {
    final bombNum = math.Random().nextInt(
      SettingsController.to.boardSize * SettingsController.to.boardSize,
    );
    _bombRow = bombNum ~/ SettingsController.to.boardSize;
    _bombColumn = bombNum % SettingsController.to.boardSize;
  }

  final List<List<RxBool>> _isEnabledBoard = List.generate(
    SettingsController.to.boardSize,
    (_) => List.generate(SettingsController.to.boardSize, (_) => true.obs),
  );
  late final int _bombRow;
  late final int _bombColumn;

  bool isEnabled(int rowNum, int columnNum) =>
      _isEnabledBoard[rowNum][columnNum].value;

  bool isBombPos(int rowNum, int columnNum) =>
      _bombRow == rowNum && _bombColumn == columnNum;

  void push(int rowNum, int columnNum) {
    GameController.to.playButtonSound();
    _isEnabledBoard[rowNum][columnNum].value = false;
  }
}
