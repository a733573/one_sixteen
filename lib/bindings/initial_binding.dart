import 'package:get/get.dart';

import '../controllers/game_controller.dart';
import '../controllers/settings_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..put(SettingsController())
      ..put(GameController());
  }
}
