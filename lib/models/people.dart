// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:star_wars_wiki/models/person.dart';

People peopleFromJson(String str) => People.fromJson(json.decode(str));

class People {
  People({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final dynamic next;
  final dynamic previous;
  final List<Person> results;

  factory People.fromJson(Map<String, dynamic> json) => People(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: List<Person>.from(json['results'].map((x) => Person.fromJson(x))),
      );
}
