import 'package:flutter/material.dart';
import 'package:star_wars_wiki/screens/movies_page.dart';
import 'package:star_wars_wiki/screens/people_page.dart';

// TODO? make movies and people load only once from API

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> widgetOptions = <Widget>[
    MoviesPage(),
    PeoplePage(),
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
