import 'dart:math' as math;

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GameController extends GetxController {
  static const title = '1/16';
  static const boardSize = 4;
  final List<RxList<bool>> isEnabledBoard =
      List.generate(boardSize, (_) => List.filled(boardSize, true).obs);
  var _bombRow = 0;
  var _bombColumn = 0;

  GameController() {
    newGame();
  }

  //static GameController get to => Get.find();

  bool isBombPos(int rowNum, int columnNum) =>
      _bombRow == rowNum && _bombColumn == columnNum;

  // bool isEnabled(int rowNum, int columnNum) =>
  //     isEnabledBoard[rowNum][columnNum].value;

  void newGame() {
    for (int rowNum = 0; rowNum < boardSize; rowNum++) {
      for (int columnNum = 0; columnNum < boardSize; columnNum++) {
        isEnabledBoard[rowNum][columnNum] = true;
      }
    }

    var bombNum = math.Random().nextInt(16);
    _bombRow = bombNum ~/ boardSize;
    _bombColumn = bombNum % boardSize;
  }

  void push(int rowNum, int columnNum) =>
      isEnabledBoard[rowNum][columnNum] = false;
}
