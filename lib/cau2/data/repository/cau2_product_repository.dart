import 'dart:convert';

import '../models/cau2_product_model.dart';
import '../services/cau2_product_api_service.dart';

class Cau2ProductRepository {
  final Cau2ProductApiService _apiService;

  Cau2ProductRepository({Cau2ProductApiService? apiService})
    : _apiService = apiService ?? Cau2ProductApiService();

  Future<Cau2ProductModel> fetchProductDetail() async {
    final response = await _apiService.getProductDetail();

    if (response.statusCode != 200) {
      throw Exception('Failed to load product: ${response.statusCode}');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Invalid product payload');
    }

    return Cau2ProductModel.fromJson(decoded);
  }
}
