import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../models/board.dart';

class GameController extends GetxController {
  final _board = Board().obs;
  final AudioCache _player = AudioCache();

  @override
  void onInit() {
    super.onInit();
    _player.loadAll(['sounds/push_button.mp3', 'sounds/board_init.mp3']);
  }

  static GameController get to => Get.find();

  Board get board => _board.value;

  void boardInit() {
    _player.play('sounds/board_init.mp3');
    _board.value = Board();
  }

  void playButtonSound() => _player.play('sounds/push_button.mp3');
}
