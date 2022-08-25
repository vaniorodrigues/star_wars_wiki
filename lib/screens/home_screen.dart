import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

import 'package:star_wars_wiki/components/bottom_nav_bar.dart';
import 'package:star_wars_wiki/screens/pages/fluttermoji_page.dart';
import 'package:star_wars_wiki/screens/pages/in_app_web_view_page.dart';
import 'package:star_wars_wiki/widgets/website_button.dart';

const double favoriteIconSize = 24;
const Color favoriteButtonColor = Color.fromARGB(243, 255, 217, 0);
const Color colorMovieFavorite = Color.fromARGB(255, 244, 67, 54);
const Color colorPersonFavorite = Color.fromARGB(255, 29, 218, 35);
const Color colorButtonsWebView = Color.fromARGB(255, 0, 255, 115);
const Color colorTopArea = Color.fromARGB(255, 25, 26, 26);
const Color buttonTopArea = Color.fromARGB(255, 127, 126, 126);
const Color saveAvatarButton = Color.fromARGB(255, 202, 65, 65);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isWebViewVisible = false;
  bool isFlutterMojiVisible = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: colorTopArea,
            height: height * 0.15,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MainMenuButton(
                      text: 'Site Oficial',
                      backgroundColor: (isWebViewVisible) ? colorButtonsWebView : buttonTopArea,
                      onPressed: () {
                        setState(() => isWebViewVisible = !isWebViewVisible);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() => isFlutterMojiVisible = !isFlutterMojiVisible);
                      },
                      child: FluttermojiCircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: (isWebViewVisible)
                ? const InAppWebViewPage()
                : (isFlutterMojiVisible)
                    ? const FluttermojiPage()
                    : const BottomNavBar(),
          )
        ],
      ),
    );
  }
}
