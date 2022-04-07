import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../bindings/initial_binding.dart';
import '../views/start_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bomb Game',
      initialBinding: InitialBinding(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const StartView(),
    );
  }
}
