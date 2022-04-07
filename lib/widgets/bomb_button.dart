import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/game_controller.dart';
import '../controllers/settings_controller.dart';

class BombButton extends StatelessWidget {
  // {}で囲むとMAP型になる。MAP型を引数にすると名前付き引数になる。
  const BombButton({
    Key? key,
    // コンストラクタでもらった値を代入して初期化
    required this.rowNum,
    required this.columnNum,
  }) : super(key: key);

  final int rowNum;
  final int columnNum;

  @override
  Widget build(BuildContext context) {
    final btnSize =
        context.mediaQueryShortestSide * 0.75 / SettingsController.to.boardSize;

    return Obx(
      () => (GameController.to.board.isGameOver ||
                  GameController.to.board.isGameClear) &&
              GameController.to.board.isBombPos(rowNum, columnNum)
          ? Container(
              width: btnSize,
              height: btnSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: GameController.to.board.isGameOver
                      ? const AssetImage('assets/images/explosion.png')
                      : const AssetImage('assets/images/bomb.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: !GameController.to.board.isEnabled(rowNum, columnNum)
                  ? null
                  : () {
                      if (GameController.to.board.isGameOver ||
                          GameController.to.board.isGameClear) {
                        return;
                      }
                      GameController.to.board.push(rowNum, columnNum);
                      // ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
                      // if (GameController.to.board
                      //     .isBombPos(rowNum, columnNum)) {
                      //   openDialog();
                      // } else {
                      //   openSnackBar();
                      // }
                    },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(btnSize, btnSize),
                shape: const CircleBorder(),
                primary: SettingsController.to.buttonColor,
              ),
              child: const Text(''),
            ),
    );
  }

  void openSnackBar() {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        content: Text('セーフ'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void openDialog() {
    Get.defaultDialog(
      title: '',
      middleText: 'アウト',
      barrierDismissible: false,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            GameController.to.boardInit();
            Get.back();
          },
          child: const Text(
            '新規ゲーム',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            '戻る',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
