import 'package:http/http.dart' as http;

class Cau5TaskApiService {
  static const String _tasksUrl =
      'https://jsonplaceholder.typicode.com/todos?_limit=15';
  static const String _baseTaskUrl =
      'https://jsonplaceholder.typicode.com/todos';

  Future<http.Response> getTasks() {
    return http.get(
      Uri.parse(_tasksUrl),
      headers: const {'Accept': 'application/json'},
    );
  }

  Future<http.Response> deleteTask(int taskId) {
    return http.delete(
      Uri.parse('$_baseTaskUrl/$taskId'),
      headers: const {'Accept': 'application/json'},
    );
  }
}
