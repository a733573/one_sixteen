import 'package:flutter/material.dart';

import 'Board.dart';

class MyBombButton extends StatefulWidget {
  final Button button;

  const MyBombButton({Key? key, required this.button}) : super(key: key);

  @override
  State<MyBombButton> createState() => _MyBombButton();
}

class _MyBombButton extends State<MyBombButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !widget.button.isEnabled
          ? null
          : () {
              if (!widget.button.isBomb) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('セーフ'),
                ));
              } else {
                showDialog<String>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text('アウト'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.pop(context, 'OK'),
                      ),
                    ],
                  ),
                );
              }
              setState(() {
                widget.button.push();
              });
            },
      child: const Text('Btn'),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(70, 70),
        shape: const CircleBorder(),
        primary: Colors.red,
      ),
    );
  }
}
