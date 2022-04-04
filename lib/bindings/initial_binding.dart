import 'package:get/get.dart';
import 'package:one_sixteen/controllers/start_controller.dart';

import '../controllers/game_controller.dart';
import '../controllers/settings_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..put(SettingsController())
      ..put(StartController())
      ..put(GameController());
  }
}
