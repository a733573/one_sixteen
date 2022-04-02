import 'package:get/get.dart';

import '../models/board.dart';

class GameController extends GetxController {
  final _board = Board();

  Board get board => _board;
}
