import 'package:flutter/material.dart';
import 'package:star_wars_wiki/widgets/favorite_button.dart';

/// Checks in database if movie is favorite or not
class FavoriteFetcher extends StatelessWidget {
  const FavoriteFetcher(
    this.object, {
    Key? key,
    required this.dao,
  }) : super(key: key);

  final dynamic object;
  final dynamic dao;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dao.isFavorite(object),
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return FavoriteButton(object, dao: dao, isFavorite: snapshot.data!);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
