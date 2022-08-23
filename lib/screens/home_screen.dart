import 'package:flutter/material.dart';

import 'package:star_wars_wiki/screens/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: height * 0.2,
          child: Container(color: Color.fromARGB(255, 223, 217, 217)),
        ),
        Expanded(
          child: BottomNavBar(),
        ),
      ],
    );
  }
}
