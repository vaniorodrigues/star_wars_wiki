import 'package:flutter/material.dart';

import 'package:star_wars_wiki/components/bottom_nav_bar.dart';
import 'package:star_wars_wiki/components/top_area.dart';

const double favoriteIconSize = 24;
const Color favoriteButtonColor = Color.fromARGB(243, 255, 217, 0);
const Color colorMovieFavorite = Color.fromARGB(255, 244, 67, 54);
const Color colorPersonFavorite = Color.fromARGB(255, 29, 218, 35);
const Color colorButtonsWebView = Color.fromARGB(255, 0, 255, 115);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: height * 0.15,
          child: TopArea(),
        ),
        Expanded(
          child: BottomNavBar(),
        ),
      ],
    );
  }
}
