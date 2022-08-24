import 'package:flutter/material.dart';
import 'package:star_wars_wiki/screens/home_screen.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton(
    this.object, {
    Key? key,
    required this.isFavorite,
    required this.dao,
  }) : super(key: key);

  final dynamic object;
  final bool isFavorite;
  final dynamic dao;

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
        widget.dao.updateFavorite(widget.object);
        setState(() => isFavorite = !isFavorite);
      },
      child: (isFavorite)
          ? const Icon(Icons.favorite, color: favoriteButtonColor, size: favoriteIconSize)
          : const Icon(Icons.favorite_border, color: favoriteButtonColor, size: favoriteIconSize),
    );
  }
}
