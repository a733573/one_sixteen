import 'dart:math' as math;

import 'package:get/get.dart';

class GameController extends GetxController {
  GameController() {
    newGame();
  }

  static const boardSize = 4;

  // .obs 監視したい値につける(宣言するとき)と再描画してくれる
  // 監視できる値は、変数とList、インスタンスのフィールド

  // リストを初期化するとgenerate,filledがある
  // filledは同じ値を埋めたいとき。generateは違う値を返す。
  // => arrow関数のことで、{}とreturnの省略をする。(_){return XXX;} = (_) => XXX
  final List<List<RxBool>> _isEnabledBoard = List.generate(
    boardSize,
    (_) => List.generate(boardSize, (_) => true.obs),
  );

  // getter setter でプライベートの変数にアクセスするために使用する。
  var _bombRow = 0;
  var _bombColumn = 0;

  bool isEnabled(int rowNum, int columnNum) =>
      _isEnabledBoard[rowNum][columnNum].value;

  bool isBombPos(int rowNum, int columnNum) =>
      _bombRow == rowNum && _bombColumn == columnNum;

  void newGame() {
    for (var rowNum = 0; rowNum < boardSize; rowNum++) {
      for (var columnNum = 0; columnNum < boardSize; columnNum++) {
        _isEnabledBoard[rowNum][columnNum].value = true;
      }
    }

    final bombNum = math.Random().nextInt(16);
    _bombRow = bombNum ~/ boardSize;
    _bombColumn = bombNum % boardSize;
  }

  void push(int rowNum, int columnNum) =>
      _isEnabledBoard[rowNum][columnNum].value = false;
}
