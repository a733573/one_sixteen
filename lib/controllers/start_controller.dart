import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class StartController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _player.load('game_start.mp3');
  }

  static StartController get to => Get.find();

  final AudioCache _player = AudioCache(prefix: 'assets/sounds/');

  void playGameStartSound() => _player.play('game_start.mp3');
}
