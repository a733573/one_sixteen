import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_sixteen/widgets/bomb_button.dart';

import '../controllers/game_controller.dart';
import '../models/board.dart';

class GameView extends StatelessWidget {
  // super・・・親クラスのコンストラクタを呼び出す。
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GameController());
    // final・・・遅延初期化定数
    // game_controller
    // gameController dartの場合使用する.定数と変数の宣言をするとき　(キャメルケース)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int columnNum = 0;
                    columnNum < Board.size;
                    columnNum++) ...{
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int rowNum = 0; rowNum < Board.size; rowNum++) ...{
                        BombButton(
                          rowNum: rowNum,
                          columnNum: columnNum,
                        ),
                      }
                    ],
                  ),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
