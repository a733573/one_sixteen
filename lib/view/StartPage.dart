import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_sixteen/view/GamePage.dart';
import '../controller/GameController.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);
  final gamePage = GamePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(GameController.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Get.to(gamePage),
          child: const Text('スタート'),
        ),
      ),
    );
  }
}
