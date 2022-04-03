import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/game_controller.dart';
import '../controllers/settings_controller.dart';
import '../views/settings_view.dart';
import '../widgets/bomb_button.dart';

class GameView extends StatelessWidget {
  // super・・・親クラスのコンストラクタを呼び出す。
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find();
    final SettingsController settingsController = Get.find();
    // final・・・遅延t期化定数
    // game_controller
    // gameController dartの場合使用する.定数と変数の宣言をするとき　(キャメルケース)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
        actions: [
          IconButton(
            onPressed: () => {gameController.board.newGame()},
            icon: const Icon(Icons.fiber_new),
          ),
          IconButton(
            onPressed: () => Get.to(() => const SettingsView()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/texture.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Obx(
              () => Container(
                color: settingsController.boardColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int columnNum = 0;
                        columnNum < SettingsController.to.boardSize;
                        columnNum++) ...{
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int rowNum = 0;
                              rowNum < SettingsController.to.boardSize;
                              rowNum++) ...{
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
        ),
      ),
    );
  }
}
