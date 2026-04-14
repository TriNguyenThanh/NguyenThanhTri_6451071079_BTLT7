import 'package:http/http.dart' as http;

class Cau1UserApiService {
  static const String _usersUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<http.Response> getUsers() async {
    return http.get(
      Uri.parse(_usersUrl),
      headers: const {'Accept': 'application/json'},
    );
  }
}
