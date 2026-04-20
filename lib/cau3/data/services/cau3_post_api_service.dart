import 'dart:convert';

import 'package:http/http.dart' as http;

class Cau3PostApiService {
  static const String _postUrl =
      'https://69e5d0ddce4e908a155e73e1.mockapi.io/api/v1/post';

  Future<http.Response> createPost({
    required String title,
    required String body,
  }) {
    return http.post(
      Uri.parse(_postUrl),
      headers: const {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'title': title, 'body': body, 'userId': 1}),
    );
  }
}
