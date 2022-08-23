import 'dart:convert';

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

class Person {
  Person({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String homeworld;
  final List<String> films;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json['name'],
        height: json['height'],
        mass: json['mass'],
        hairColor: json['hair_color'],
        skinColor: json['skin_color'],
        eyeColor: json['eye_color'],
        birthYear: json['birth_year'],
        homeworld: json['homeworld'],
        films: List<String>.from(json['films'].map((x) => x)),
        species: List<String>.from(json['species'].map((x) => x)),
        vehicles: List<String>.from(json['vehicles'].map((x) => x)),
        starships: List<String>.from(json['starships'].map((x) => x)),
        created: DateTime.parse(json['created']),
        edited: DateTime.parse(json['edited']),
        url: json['url'],
      );
}
