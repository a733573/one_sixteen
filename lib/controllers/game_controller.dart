import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../models/board.dart';

class GameController extends GetxController {
  final _board = Board().obs;
  final AudioCache _player = AudioCache(prefix: 'assets/sounds/');

  @override
  void onInit() {
    super.onInit();
    _player.loadAll([
      'push_button.mp3',
      'board_init.mp3',
      'explosion.mp3',
      'clear.mp3',
    ]);
  }

  static GameController get to => Get.find();

  Board get board => _board.value;

  void boardInit() {
    _player.play('board_init.mp3');
    _board.value = Board();
  }

  void playButtonSound() => _player.play('push_button.mp3');

  void playExplosionSound() => _player.play('explosion.mp3');

  void playClearSound() => _player.play('clear.mp3');
}
