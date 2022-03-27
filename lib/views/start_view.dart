import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_sixteen/views/game_view.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Get.to(() => const GameView()),
          child: const Text(
            'Game Start',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
