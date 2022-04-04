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
    final btnSize = context.width * 0.75 / SettingsController.to.boardSize;

    return Obx(
      () => ElevatedButton(
        onPressed: !GameController.to.board.isEnabled(rowNum, columnNum)
            ? null
            : () {
                GameController.to.board.push(rowNum, columnNum);
                if (GameController.to.board.isBombPos(rowNum, columnNum)) {
                  openDialog();
                } else {
                  openSnackBar();
                }
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
    ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
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
