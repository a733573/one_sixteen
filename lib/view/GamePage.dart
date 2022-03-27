import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/GameController.dart';
import 'BombButton.dart';

class GamePage extends StatelessWidget {
  // super・・・親クラスのコンストラクタを呼び出す。
  GamePage({Key? key}) : super(key: key);
  final GameController gameController = Get.find();

  @override
  Widget build(BuildContext context) {
    // final・・・遅延初期定数
    // game_controller
    // gameController dartの場合使用する.定数と変数の宣言をするとき　(キャメルケース)

    return Scaffold(
      appBar: AppBar(
        // 定数を使いたいときは、ControllerでStatic定義してGameControlle.～のように呼び出す
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
