import 'package:http/http.dart' as http;

class Cau7NewsApiService {
  static const String _newsUrl =
      'https://jsonplaceholder.typicode.com/posts?_limit=20';

  Future<http.Response> getNews() {
    return http.get(
      Uri.parse(_newsUrl),
      headers: const {'Accept': 'application/json'},
    );
  }
}
