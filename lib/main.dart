import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/initial_binding.dart';
import '../views/start_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '1/16',
      initialBinding: InitialBinding(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const StartView(),
    );
  }
}
