import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              settingsController.buttonColor = Colors.blue;
            },
            child: const Text('Change Button Color'),
          )
        ],
      ),
    );
  }
}
