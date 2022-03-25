import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyBombButton.dart';

void main() {
  runApp(const GetMaterialApp(home: GamePage()));
}

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

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.put(GameController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(GameController.title),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int columnNum = 0;
                  columnNum < GameController.boardSize;
                  columnNum++) ...{
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int rowNum = 0;
                        rowNum < GameController.boardSize;
                        rowNum++) ...{
                      Obx(() => MyBombButton(
                            rowNum: rowNum,
                            columnNum: columnNum,
                            isEnabled: gameController.isEnabledBoard[rowNum]
                                [columnNum],
                          ))
                    }
                  ],
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
