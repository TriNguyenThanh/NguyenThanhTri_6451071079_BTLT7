import '../data/post.dart';
import '../data/repository/cau3_post_repository.dart';

class Cau3PostController {
  final Cau3PostRepository _repository;

  Cau3PostController({Cau3PostRepository? repository})
    : _repository = repository ?? Cau3PostRepository();

  Future<Post> createPost({required String title, required String body}) async {
    return _repository.createPost(title: title, body: body);
  }
}
