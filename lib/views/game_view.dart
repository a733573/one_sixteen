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
    return Scaffold(
      appBar: AppBar(
        title: const Text('ゲーム'),
        actions: [
          IconButton(
            onPressed: () => openDialog(),
            icon: const Icon(Icons.fiber_new),
          ),
          IconButton(
            onPressed: () => Get.to(() => const SettingsView()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => (GameController.to.board.isGameOver ||
                GameController.to.board.isGameClear)
            ? openDialog()
            : null,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black54,
          ),
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Obx(
                () => DecoratedBox(
                  decoration: BoxDecoration(
                    color: SettingsController.to.boardColor,
                    border: Border.all(color: Colors.yellow, width: 10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
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
        ),
      ),
    );
  }

  void openDialog() {
    Get.defaultDialog(
      title: '',
      middleText: '新しくゲームを始めますか？',
      // barrierDismissible: false,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            GameController.to.boardInit();
            Get.back();
          },
          child: const Text(
            'はい',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            'キャンセル',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
