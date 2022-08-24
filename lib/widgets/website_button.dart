import 'package:flutter/material.dart';

class WebSiteButton extends StatelessWidget {
  const WebSiteButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(255, 127, 126, 126),
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
