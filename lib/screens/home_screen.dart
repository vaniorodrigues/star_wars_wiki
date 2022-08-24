import 'package:flutter/material.dart';

import 'package:star_wars_wiki/screens/bottom_nav_bar.dart';

const double favoriteIconSize = 24;
const Color favoriteButtonColor = Color.fromARGB(243, 255, 217, 0);
const Color colorMovieFavorite = Colors.red;
const Color colorPersonFavorite = Color.fromARGB(255, 29, 218, 35);

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
