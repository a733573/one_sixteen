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
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Button Color'),
                    Obx(() {
                      return DropdownButton(
                        items: [
                          DropdownMenuItem(
                            value: Colors.red.value,
                            child: const Text('Red'),
                          ),
                          DropdownMenuItem(
                            value: Colors.blue.value,
                            child: const Text('Blue'),
                          ),
                          DropdownMenuItem(
                            value: Colors.green.value,
                            child: const Text('Green'),
                          ),
                          DropdownMenuItem(
                            value: Colors.yellow.value,
                            child: const Text('Yellow'),
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
                    const Text('Board Color'),
                    Obx(() {
                      return DropdownButton(
                        items: [
                          DropdownMenuItem(
                            value: Colors.grey.value,
                            child: const Text('Grey'),
                          ),
                          DropdownMenuItem(
                            value: Colors.purple.value,
                            child: const Text('Purple'),
                          ),
                          DropdownMenuItem(
                            value: Colors.black.value,
                            child: const Text('Black'),
                          ),
                          DropdownMenuItem(
                            value: Colors.pink.value,
                            child: const Text('Pink'),
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
                    const Text('Board Size'),
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
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  void openDialog(int value) {
    Get.defaultDialog(
      title: '',
      middleText: 'ボードサイズを変更するとゲームがリセットされますが、よろしいですか？',
      barrierDismissible: false,
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
