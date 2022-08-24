import 'package:flutter/material.dart';
import 'package:star_wars_wiki/database/dao/person_dao.dart';
import 'package:star_wars_wiki/models/people.dart';
import 'package:star_wars_wiki/widgets/person_card.dart';

class PeopleListView extends StatelessWidget {
  final List<People> people;
  final PersonDao dao;

  const PeopleListView(this.people, {super.key, required this.dao});

  @override
  Widget build(BuildContext context) {
    final List<Person> caracters = _singleListofPeople(people);
    return ListView.builder(
      itemCount: caracters.length,
      itemBuilder: (context, index) {
        final Person person = caracters[index];
        return PersonCard(
          person: person,
          dao: dao,
        );
      },
    );
  }

  // Get all the people from the lists of people of each page and return in a single list.
  List<Person> _singleListofPeople(List<People> people) {
    List<Person> caracters = [];
    for (var i = 0; i < people.length; i++) {
      for (var j = 0; j < people[i].results.length; j++) {
        caracters.add(people[i].results[j]);
      }
    }
    return caracters;
  }
}
