import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_sixteen/views/widgets/BombButton.dart';

import '../controllers/GameController.dart';

class GameView extends StatelessWidget {
  final GameController gameController = Get.put(GameController());

  // super・・・親クラスのコンストラクタを呼び出す。
  GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final・・・遅延初期化定数
    // game_controller
    // gameController dartの場合使用する.定数と変数の宣言をするとき　(キャメルケース)

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
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
