import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_sixteen/controllers/game_controller.dart';

class BombButton extends StatelessWidget {
  // {}で囲むとMAP型になる。MAP型を引数にすると名前付き引数になる。
  const BombButton({
    Key? key,
    // コンストラクタでもらった値を代入して初期化
    required int rowNum,
    required int columnNum,
    required bool isEnabled,
  })  : _rowNum = rowNum,
        _columnNum = columnNum,
        _isEnabled = isEnabled,
        super(key: key);

  final int _rowNum;
  final int _columnNum;
  final bool _isEnabled;

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find();
    final btnSize = context.mediaQueryShortestSide / 5.5;

    return ElevatedButton(
      onPressed: !_isEnabled
          ? null
          : () {
              gameController.push(_rowNum, _columnNum);
              if (gameController.isBombPos(_rowNum, _columnNum)) {
                // openDialog(gameController);
              } else {
                // openSnackBar(context);
              }
            },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(btnSize, btnSize),
        shape: const CircleBorder(),
        primary: Colors.red,
      ),
      child: const Text('Btn'),
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

  void openDialog(GameController gameController) {
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
            gameController.newGame();
            // 前の画面に戻る。
            Get.back();
          },
          child: const Text('New Game'),
        ),
      ],
    );
  }
}
