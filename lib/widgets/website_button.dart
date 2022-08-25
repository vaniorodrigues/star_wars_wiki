import 'package:flutter/material.dart';

class MainMenuButton extends StatelessWidget {
  const MainMenuButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = const Color.fromARGB(255, 127, 126, 126),
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
      ),
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 242, 242, 242)),
      ),
    );
  }
}
