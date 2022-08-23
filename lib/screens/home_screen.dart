import 'package:flutter/material.dart';

import 'package:star_wars_wiki/components/bottom_nav_bar.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavBar();
//   }
// }

import 'package:star_wars_wiki/components/centered_message.dart';
import 'package:star_wars_wiki/components/circular_progress.dart';
import 'package:star_wars_wiki/http/webclients/movies_webclient.dart';
import 'package:star_wars_wiki/models/movies.dart';

class TransactionsList extends StatelessWidget {
  // final List<Transaction> transactions = [];
  final MoviesWebClient _movieClient = MoviesWebClient();
  TransactionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<Movies>(
        future: _movieClient.getMovies(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              const Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                return CenteredMessage(message: 'all good', icon: Icons.check);
              }
              return const CenteredMessage(message: 'No transactions found.', icon: Icons.warning);
          }
          return const CenteredMessage(message: 'No internet connection!', icon: Icons.warning);
        },
      ),
    );
  }
}
