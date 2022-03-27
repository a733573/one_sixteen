import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_sixteen/view/StartPage.dart';

import 'controller/GameController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GameController gameController = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '1/16',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}
