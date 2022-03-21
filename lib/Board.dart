import 'dart:math' as math;

class Board {
  static const size = 4;
  final _buttons = newButtons();

  Button getButton(int column, int row) => _buttons[column][row];

  static List<List<Button>> newButtons() {
    var bombNum = math.Random().nextInt(16);
    var bombColumn = bombNum % size;
    var bombRow = bombNum ~/ size;
    return List.generate(
        size,
        (column) => List.generate(
            size, (row) => Button(column == bombColumn && row == bombRow)));
  }
}

class Button {
  var _isEnabled = true;
  final bool _isBomb;

  Button(this._isBomb);

  bool get isEnabled => _isEnabled;

  bool get isBomb => _isBomb;

  void push() {
    _isEnabled = false;
  }
}
