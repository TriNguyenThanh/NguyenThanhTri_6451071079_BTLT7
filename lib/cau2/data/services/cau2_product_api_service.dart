import 'package:http/http.dart' as http;

class Cau2ProductApiService {
  static const String _productDetailUrl = 'https://fakestoreapi.com/products/1';

  Future<http.Response> getProductDetail() {
    return http.get(
      Uri.parse(_productDetailUrl),
      headers: const {'Accept': 'application/json'},
    );
  }
}
