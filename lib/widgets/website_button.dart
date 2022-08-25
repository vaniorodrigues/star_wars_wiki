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
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        // elevation: MaterialStateProperty.all<double>(3),
        // shadowColor: MaterialStateProperty.all<Color>(Colors.white),
        // surfaceTintColor: MaterialStateProperty.all<Color>(Colors.white),
        // overlayColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 242, 242, 242)),
          ),
          const SizedBox(
            width: 8.0,
            height: 48.0,
          ),
          const Icon(Icons.launch),
        ],
      ),
    );
  }
}
