import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class StartController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _player.load('assets/sounds/game_start.mp3');
  }

  static StartController get to => Get.find();

  final AudioCache _player = AudioCache();

  void playGameStartSound() => _player.play('sounds/game_start.mp3');
}
