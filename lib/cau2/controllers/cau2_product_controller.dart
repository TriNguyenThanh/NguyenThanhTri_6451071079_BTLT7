import '../data/models/cau2_product_model.dart';
import '../data/repository/cau2_product_repository.dart';

class Cau2ProductController {
  final Cau2ProductRepository _repository;

  Cau2ProductController({Cau2ProductRepository? repository})
    : _repository = repository ?? Cau2ProductRepository();

  Future<Cau2ProductModel> getProductDetail() {
    return _repository.fetchProductDetail();
  }
}
