import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_sixteen/views/start_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '1/16',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartView(),
    );
  }
}
