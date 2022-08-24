class Person {
  Person(
    this.id, {
    required this.name,
  });

  int id;
  final String name;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        json['id'] ?? 0,
        name: json['name'],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  @override
  String toString() => 'Person(name: $name)';
}
