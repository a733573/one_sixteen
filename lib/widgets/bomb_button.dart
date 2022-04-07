import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';

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
        context.mediaQueryShortestSide * 0.7 / SettingsController.to.boardSize;

    return Obx(
      () => (GameController.to.board.isGameOver ||
                  GameController.to.board.isGameClear) &&
              GameController.to.board.isBombPos(rowNum, columnNum)
          ? Container(
              width: btnSize,
              height: btnSize,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: GameController.to.board.isGameOver
                      ? const AssetImage('assets/images/explosion.png')
                      : const AssetImage('assets/images/bomb.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : !GameController.to.board.isEnabled(rowNum, columnNum)
              ? Container(
                  height: btnSize,
                  width: btnSize,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                )
              : SizedBox(
                  width: btnSize,
                  child: PushableButton(
                    onPressed: () {
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
                    hslColor:
                        HSLColor.fromColor(SettingsController.to.buttonColor),
                    height: btnSize,
                    shadow: BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 8),
                    ),
                    child: const Text(''),
                  ),
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
