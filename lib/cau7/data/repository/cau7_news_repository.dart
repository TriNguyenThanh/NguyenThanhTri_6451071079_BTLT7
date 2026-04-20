import 'dart:convert';

import '../models/cau7_news_model.dart';
import '../services/cau7_news_api_service.dart';

class Cau7NewsRepository {
  final Cau7NewsApiService _apiService;

  Cau7NewsRepository({Cau7NewsApiService? apiService})
    : _apiService = apiService ?? Cau7NewsApiService();

  Future<List<Cau7NewsModel>> fetchNews() async {
    final response = await _apiService.getNews();

    if (response.statusCode != 200) {
      throw Exception('Failed to load news: ${response.statusCode}');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw Exception('Invalid news payload');
    }

    return decoded
        .whereType<Map<String, dynamic>>()
        .map(Cau7NewsModel.fromJson)
        .toList();
  }
}
