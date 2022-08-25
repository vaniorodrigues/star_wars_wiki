import 'package:flutter/material.dart';

import 'package:star_wars_wiki/components/bottom_nav_bar.dart';
import 'package:star_wars_wiki/components/top_area.dart';
import 'package:star_wars_wiki/screens/pages/in_app_web_view_screen.dart';
import 'package:star_wars_wiki/widgets/website_button.dart';

const double favoriteIconSize = 24;
const Color favoriteButtonColor = Color.fromARGB(243, 255, 217, 0);
const Color colorMovieFavorite = Color.fromARGB(255, 244, 67, 54);
const Color colorPersonFavorite = Color.fromARGB(255, 29, 218, 35);
const Color colorButtonsWebView = Color.fromARGB(255, 0, 255, 115);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isWebViewVisible = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: height * 0.15,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MainMenuButton(
                    text: 'Site Oficial',
                    backgroundColor: (isWebViewVisible) ? colorButtonsWebView : Color.fromARGB(255, 127, 126, 126),
                    onPressed: () {
                      setState(() => isWebViewVisible = !isWebViewVisible);
                    },
                  ),
                  Icon(
                    Icons.account_circle,
                    size: 48,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: (isWebViewVisible) ? InAppWebViewPage() : BottomNavBar(),
        )
      ],
    );
  }
}
