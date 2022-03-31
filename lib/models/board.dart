import 'dart:math' as math;

import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Board {
  Board() {
    newGame();
  }

  static const size = 4;
  final List<List<RxBool>> _isEnabledBoard = List.generate(
    size,
    (_) => List.generate(size, (_) => true.obs),
  );
  var _bombRow = 0;
  var _bombColumn = 0;

  bool isEnabled(int rowNum, int columnNum) =>
      _isEnabledBoard[rowNum][columnNum].value;

  bool isBombPos(int rowNum, int columnNum) =>
      _bombRow == rowNum && _bombColumn == columnNum;

  void newGame() {
    for (var rowNum = 0; rowNum < size; rowNum++) {
      for (var columnNum = 0; columnNum < size; columnNum++) {
        _isEnabledBoard[rowNum][columnNum].value = true;
      }
    }

    final bombNum = math.Random().nextInt(size * size);
    _bombRow = bombNum ~/ size;
    _bombColumn = bombNum % size;
  }

  void push(int rowNum, int columnNum) =>
      _isEnabledBoard[rowNum][columnNum].value = false;
}
