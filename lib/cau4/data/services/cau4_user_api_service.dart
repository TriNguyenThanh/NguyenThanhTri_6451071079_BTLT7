import 'dart:convert';

import 'package:http/http.dart' as http;

class Cau4UserApiService {
  static const String _userUrl = 'https://69e5d0ddce4e908a155e73e1.mockapi.io/api/v1/users/1';

  Future<http.Response> getUserInfo() {
    return http.get(
      Uri.parse(_userUrl),
      headers: const {'Accept': 'application/json'},
    );
  }

  Future<http.Response> updateUserInfo({required Map<String, dynamic> body}) {
    return http.put(
      Uri.parse(_userUrl),
      headers: const {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(body),
    );
  }
}