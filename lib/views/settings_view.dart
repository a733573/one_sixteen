import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/game_controller.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('ボタンの色'),
              Obx(() {
                return DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: Colors.red.value,
                      child: const Text('赤'),
                    ),
                    DropdownMenuItem(
                      value: Colors.blue.value,
                      child: const Text('青'),
                    ),
                    DropdownMenuItem(
                      value: Colors.green.value,
                      child: const Text('緑'),
                    ),
                    DropdownMenuItem(
                      value: Colors.yellow.value,
                      child: const Text('黄'),
                    ),
                  ],
                  onChanged: (int? value) {
                    SettingsController.to.buttonColorValue = value!;
                  },
                  value: SettingsController.to.buttonColorValue,
                );
              })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('ボードの色'),
              Obx(() {
                return DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: Colors.grey.value,
                      child: const Text('グレー'),
                    ),
                    DropdownMenuItem(
                      value: Colors.purple.value,
                      child: const Text('紫'),
                    ),
                    DropdownMenuItem(
                      value: Colors.black.value,
                      child: const Text('黒'),
                    ),
                    DropdownMenuItem(
                      value: Colors.pink.value,
                      child: const Text('ピンク'),
                    ),
                  ],
                  onChanged: (int? value) {
                    SettingsController.to.boardColorValue = value!;
                  },
                  value: SettingsController.to.boardColorValue,
                );
              })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('ボードサイズ'),
              Obx(() {
                return DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: 4,
                      child: Text('4'),
                    ),
                    DropdownMenuItem(
                      value: 5,
                      child: Text('5'),
                    ),
                    DropdownMenuItem(
                      value: 6,
                      child: Text('6'),
                    ),
                  ],
                  onChanged: (int? value) {
                    if (SettingsController.to.boardSize != value) {
                      // SettingsController.to.boardSize = value!;
                      // GameController.to.boardInit();
                      openDialog(value!);
                    }
                  },
                  value: SettingsController.to.boardSize,
                );
              })
            ],
          ),
        ],
      ),
    );
  }

  void openDialog(int value) {
    Get.defaultDialog(
      title: '',
      middleText: 'ボードサイズを変更すると\nゲームがリセットされますが\nよろしいですか？',
      // barrierDismissible: false,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            SettingsController.to.boardSize = value;
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
