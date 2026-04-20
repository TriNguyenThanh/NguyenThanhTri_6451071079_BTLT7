import 'dart:convert';

import '../models/cau6_product_model.dart';
import '../services/cau6_product_api_service.dart';

class Cau6ProductRepository {
  final Cau6ProductApiService _apiService;

  Cau6ProductRepository({Cau6ProductApiService? apiService})
    : _apiService = apiService ?? Cau6ProductApiService();

  Future<List<Cau6ProductModel>> searchProducts(String keyword) async {
    final response = await _apiService.searchProducts(keyword);

    if (response.statusCode != 200) {
      throw Exception('Failed to search products: ${response.statusCode}');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Invalid search payload');
    }

    final dynamic productsData = decoded['products'];
    if (productsData is! List) {
      return [];
    }

    return productsData
        .whereType<Map<String, dynamic>>()
        .map(Cau6ProductModel.fromJson)
        .toList();
  }
}
