import 'dart:convert';

import '../models/cau5_task_model.dart';
import '../services/cau5_task_api_service.dart';

class Cau5TaskRepository {
  final Cau5TaskApiService _apiService;

  Cau5TaskRepository({Cau5TaskApiService? apiService})
    : _apiService = apiService ?? Cau5TaskApiService();

  Future<List<Cau5TaskModel>> fetchTasks() async {
    final response = await _apiService.getTasks();

    if (response.statusCode != 200) {
      throw Exception('Failed to load tasks: ${response.statusCode}');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw Exception('Invalid tasks payload');
    }

    return decoded
        .whereType<Map<String, dynamic>>()
        .map(Cau5TaskModel.fromJson)
        .toList();
  }

  Future<void> deleteTask(int taskId) async {
    final response = await _apiService.deleteTask(taskId);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task: ${response.statusCode}');
    }
  }
}
