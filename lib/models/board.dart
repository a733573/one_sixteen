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
    print(bombNum);
  }

  final List<List<RxBool>> _isEnabledBoard = List.generate(
    SettingsController.to.boardSize,
    (_) => List.generate(SettingsController.to.boardSize, (_) => true.obs),
  );
  late final int _bombRow;
  late final int _bombColumn;
  var _remainingButtons =
      SettingsController.to.boardSize * SettingsController.to.boardSize;

  var _isGameOver = false;
  var _isGameClear = false;

  bool get isGameOver => _isGameOver;

  bool get isGameClear => _isGameClear;

  bool isEnabled(int rowNum, int columnNum) =>
      _isEnabledBoard[rowNum][columnNum].value;

  bool isBombPos(int rowNum, int columnNum) =>
      _bombRow == rowNum && _bombColumn == columnNum;

  void push(int rowNum, int columnNum) {
    if (_isGameOver || _isGameClear) {
      return;
    }

    _isEnabledBoard[rowNum][columnNum].value = false;
    _remainingButtons--;

    if (isBombPos(rowNum, columnNum)) {
      GameController.to.playExplosionSound();
      _isGameOver = true;
    } else if (_remainingButtons == 1) {
      GameController.to.playClearSound();
      _isEnabledBoard[_bombRow][_bombColumn].value = false;
      _isGameClear = true;
    } else {
      GameController.to.playButtonSound();
    }
  }
}
