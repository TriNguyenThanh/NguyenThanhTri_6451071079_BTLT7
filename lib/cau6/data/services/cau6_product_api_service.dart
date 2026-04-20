import 'package:http/http.dart' as http;

class Cau6ProductApiService {
  static const String _url =
      'https://69e5d0ddce4e908a155e73e1.mockapi.io/api/v1/products';

  Future<http.Response> searchProducts(String keyword) {
    final uri = Uri.parse('$_url?q=$keyword');

    return http.get(uri, headers: const {'Accept': 'application/json'});
  }
}
