import 'package:http/http.dart';
import 'package:star_wars_wiki/http/webclient.dart';
import 'package:star_wars_wiki/models/movies.dart';

class MoviesWebClient {
  Future<Movies> getMovies() async {
    const String url = '$baseUrl/films';
    final Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return moviesFromJson(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
