import 'package:flutter/material.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/models/movies.dart';

const Color favColor = Color.fromARGB(255, 228, 78, 67);
const double favIconSize = 24;

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    Key? key,
    required this.movie,
    required this.isFavorite,
    required this.daoMovie,
  }) : super(key: key);

  final Movie movie;
  final bool isFavorite;
  final MovieDao daoMovie;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.daoMovie.updateFavorite(widget.movie);
        setState(() => isFavorite = !isFavorite);
      },
      child: (isFavorite)
          ? const Icon(Icons.favorite, color: favColor, size: favIconSize)
          : const Icon(Icons.favorite_border, color: favColor, size: favIconSize),
    );
  }
}
