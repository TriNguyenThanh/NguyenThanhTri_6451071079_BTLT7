import '../data/models/cau6_product_model.dart';
import '../data/repository/cau6_product_repository.dart';

class Cau6ProductController {
  final Cau6ProductRepository _repository;

  Cau6ProductController({Cau6ProductRepository? repository})
    : _repository = repository ?? Cau6ProductRepository();

  Future<List<Cau6ProductModel>> searchProducts(String keyword) {
    return _repository.searchProducts(keyword);
  }
}
