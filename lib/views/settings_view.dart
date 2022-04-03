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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Button Color'),
              Obx(() {
                return DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: Colors.red.value,
                      child: const Text('Red'),
                    ),
                    DropdownMenuItem(
                      value: Colors.blue.value,
                      child: const Text('Blue'),
                    ),
                    DropdownMenuItem(
                      value: Colors.green.value,
                      child: const Text('Green'),
                    ),
                    DropdownMenuItem(
                      value: Colors.yellow.value,
                      child: const Text('Yellow'),
                    ),
                  ],
                  onChanged: (int? value) {
                    settingsController.buttonColorValue = value!;
                  },
                  value: settingsController.buttonColorValue,
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
