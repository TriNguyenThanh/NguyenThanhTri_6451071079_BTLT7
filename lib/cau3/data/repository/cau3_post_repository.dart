import 'dart:convert';

import '../post.dart';
import '../services/cau3_post_api_service.dart';

class Cau3PostRepository {
  final Cau3PostApiService _apiService;

  Cau3PostRepository({Cau3PostApiService? apiService})
    : _apiService = apiService ?? Cau3PostApiService();

  Future<Post> createPost({required String title, required String body}) async {
    final response = await _apiService.createPost(title: title, body: body);

    if (response.statusCode != 201) {
      throw Exception('Failed to create post: ${response.statusCode}');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Invalid post payload');
    }

    return Post.fromJson(decoded);
  }
}
