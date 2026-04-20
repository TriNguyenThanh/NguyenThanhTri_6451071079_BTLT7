import 'package:http/http.dart' as http;

class Cau5TaskApiService {
  static const String _tasksUrl =
      'https://69e5d0ddce4e908a155e73e1.mockapi.io/api/v1/tasks';

  Future<http.Response> getTasks() {
    return http.get(
      Uri.parse(_tasksUrl),
      headers: const {'Accept': 'application/json'},
    );
  }

  Future<http.Response> deleteTask(int taskId) {
    return http.delete(
      Uri.parse('$_tasksUrl/$taskId'),
      headers: const {'Accept': 'application/json'},
    );
  }
}
