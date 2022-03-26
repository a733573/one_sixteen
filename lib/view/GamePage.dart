import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/GameController.dart';
import 'BombButton.dart';

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
