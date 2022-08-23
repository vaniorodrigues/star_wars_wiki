import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:star_wars_wiki/http/interceptors/logging_interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 5),
);

const String baseUrl = 'https://swapi.dev/api';
