import '../data/models/cau1_user_model.dart';
import '../data/repository/cau1_user_repository.dart';

class Cau1UserController {
  final Cau1UserRepository _repository;

  Cau1UserController({Cau1UserRepository? repository})
    : _repository = repository ?? Cau1UserRepository();

  Future<List<Cau1UserModel>> getUsers() {
    return _repository.fetchUsers();
  }
}
