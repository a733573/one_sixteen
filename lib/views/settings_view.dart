import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
    );
  }
}
