import 'package:get/get.dart';
import 'package:one_sixteen/models/board.dart';

class GameController extends GetxController {
  final _board = Board();

  Board get board => _board;
}
