import 'dart:convert';

import '../models/cau4_user_model.dart';
import '../services/cau4_user_api_service.dart';

class Cau4UserRepository {
  final Cau4UserApiService _apiService;

  Cau4UserRepository({Cau4UserApiService? apiService})
    : _apiService = apiService ?? Cau4UserApiService();

  Future<Cau4UserModel> fetchUserInfo() async {
    final response = await _apiService.getUserInfo();

    if (response.statusCode != 200) {
      throw Exception('Failed to load user info: ${response.statusCode}');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Invalid user payload');
    }

    return Cau4UserModel.fromJson(decoded);
  }

  Future<Cau4UserModel> updateUserInfo({required Cau4UserModel user}) async {
    final response = await _apiService.updateUserInfo(body: user.toJson());

    if (response.statusCode != 200) {
      throw Exception('Failed to update user info: ${response.statusCode}');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Invalid update payload');
    }

    return Cau4UserModel.fromJson(decoded);
  }
}
