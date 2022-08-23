import 'package:flutter/material.dart';
import 'package:star_wars_wiki/http/webclients/movies_webclient.dart';
import 'package:star_wars_wiki/models/movies.dart';
import 'package:star_wars_wiki/screens/movies_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final MoviesWebClient movieClient = MoviesWebClient();
  late Future<Movies> dataFuture;
  late List<Movie> movies;
  late Movies moviesData;
  bool isMoviesLoaded = false;

  List<Widget> widgetOptions = <Widget>[
    MoviesPage(),
    Text(
      'Index 1: Personagens',
      style: optionStyle,
    ),
    Text(
      'Index 2: Favoritos',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  // @override
  // void initState() {
  //   super.initState();

  //   // fetch data from API
  //   getMovies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Filmes',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personagens',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 255, 115),
        onTap: _onItemTapped,
        backgroundColor: Color.fromARGB(255, 53, 52, 52),
      ),
    );
  }

  // void getMovies() async {
  //   moviesData = await movieClient.getMovies();
  //   if (moviesData != null) {
  //     setState(() {
  //       movies = moviesData.results;
  //       isMoviesLoaded = true;
  //     });
  //   }
  //   isMoviesLoaded = true;
  // }
}
