import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_sixteen/controllers/start_controller.dart';
import 'package:pushable_button/pushable_button.dart';

import '../views/game_view.dart';
import '../views/settings_view.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スタート'),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const SettingsView()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        alignment: const Alignment(0, 0.6),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/title.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: 350,
          child: PushableButton(
            onPressed: () {
              StartController.to.playGameStartSound();
              Get.to(() => const GameView());
            },
            hslColor: HSLColor.fromColor(Colors.yellow),
            height: 60,
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
    );
  }
}
