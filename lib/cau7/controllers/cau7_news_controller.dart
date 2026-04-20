import '../data/models/cau7_news_model.dart';
import '../data/repository/cau7_news_repository.dart';

class Cau7NewsController {
  final Cau7NewsRepository _repository;

  Cau7NewsController({Cau7NewsRepository? repository})
    : _repository = repository ?? Cau7NewsRepository();

  Future<List<Cau7NewsModel>> getNews() {
    return _repository.fetchNews();
  }
}
