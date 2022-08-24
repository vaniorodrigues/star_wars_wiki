import 'package:flutter/material.dart';
import 'package:star_wars_wiki/components/favorite_fetcher.dart';
import 'package:star_wars_wiki/database/dao/person_dao.dart';
import 'package:star_wars_wiki/models/person.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.person,
    required this.dao,
    this.colorText = Colors.white,
  }) : super(key: key);

  final Person person;
  final PersonDao dao;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      elevation: 10,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(
          person.name,
          style: TextStyle(color: colorText),
        ),
        trailing: FavoriteFetcher(person, dao: dao),
      ),
    );
  }
}
