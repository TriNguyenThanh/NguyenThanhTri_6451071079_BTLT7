import 'dart:convert';

import '../models/cau1_user_model.dart';
import '../services/cau1_user_api_service.dart';

class Cau1UserRepository {
  final Cau1UserApiService _apiService;

  Cau1UserRepository({Cau1UserApiService? apiService})
    : _apiService = apiService ?? Cau1UserApiService();

  Future<List<Cau1UserModel>> fetchUsers() async {
    final response = await _apiService.getUsers();

    if (response.statusCode != 200) {
      throw Exception('Failed to load users: ${response.statusCode}');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw Exception('Invalid users payload');
    }

    return decoded
        .whereType<Map<String, dynamic>>()
        .map(Cau1UserModel.fromJson)
        .toList();
  }
}
