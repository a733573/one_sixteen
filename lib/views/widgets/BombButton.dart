import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/GameController.dart';

class MyBombButton extends StatelessWidget {
  final int rowNum;
  final int columnNum;
  final bool isEnabled;
  final GameController gameController = Get.find();

  // {}で囲むとMAP型になる。MAP型を引数にすると名前付き引数になる。
  MyBombButton({
    Key? key,
    // コンストラクタでもらった値を代入して初期化
    required this.rowNum,
    required this.columnNum,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isEnabled
          ? null
          : () {
              gameController.push(rowNum, columnNum);
              if (gameController.isBombPos(rowNum, columnNum)) {
                showDialog<String>(
                  context: context,
                  barrierDismissible: false,
                  // builderはwidgetを指定する。 AlertDialogはシンプル
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text('アウト'),
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
                          child: const Text('New Game')),
                    ],
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('セーフ'),
                ));
              }
            },
      child: const Text('Btn'),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(70, 70),
        shape: const CircleBorder(),
        primary: Colors.red,
      ),
    );
  }
}
