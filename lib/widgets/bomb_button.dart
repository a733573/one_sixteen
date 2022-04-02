import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/game_controller.dart';
import '../models/board.dart';

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
    final GameController gameController = Get.find();
    final board = gameController.board;
    final btnSize = context.mediaQueryShortestSide / 5.5;

    return Obx(
      () => ElevatedButton(
        onPressed: !board.isEnabled(rowNum, columnNum)
            ? null
            : () {
                board.push(rowNum, columnNum);
                if (board.isBombPos(rowNum, columnNum)) {
                  openDialog(board);
                } else {
                  openSnackBar(context);
                }
              },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(btnSize, btnSize),
          shape: const CircleBorder(),
          primary: Colors.red,
        ),
        child: const Text('Btn'),
      ),
    );
  }

  void openSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('セーフ'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void openDialog(Board board) {
    Get.defaultDialog(
      title: '',
      middleText: 'アウト',
      barrierDismissible: false,
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('OK'),
        ),
        TextButton(
          onPressed: () {
            board.newGame();
            // 前の画面に戻る。
            Get.back();
          },
          child: const Text('New Game'),
        ),
      ],
    );
  }
}
