import 'package:http/http.dart';
import 'package:star_wars_wiki/http/webclient.dart';
import 'package:star_wars_wiki/models/people.dart';

class PeopleWebClient {
  /// Returns a list of people from the API.
  Future<List<People>> getPeople() async {
    List<People> people = [];
    const String url = '$baseUrl/people';
    final Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      people.add(peopleFromJson(response.body));

      /// if there is a next page, fetch it and add it to the list
      while (people.last.next != null) {
        people.add(await getPeopleFromUrl(people.last.next));
      }

      return people;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  /// Returns people from a given url.
  Future<People> getPeopleFromUrl(String url) async {
    final Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return peopleFromJson(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
