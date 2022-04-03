import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_sixteen/views/settings_view.dart';

import '../views/game_view.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start'),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const SettingsView()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bomb_game.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: Get.height / 2.5),
            child: ElevatedButton(
              onPressed: () => Get.to(() => const GameView()),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow, //ボタンの背景色
              ),
              child: const Text(
                'Game Start',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
