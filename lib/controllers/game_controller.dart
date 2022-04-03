import 'package:get/get.dart';

import '../models/board.dart';

class GameController extends GetxController {
  var _board = Board();
  static GameController get to => Get.find();

  Board get board => _board;

  void boardInit(){
    _board = Board();
  }
}
