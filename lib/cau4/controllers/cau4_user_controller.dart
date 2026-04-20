import '../data/models/cau4_user_model.dart';
import '../data/repository/cau4_user_repository.dart';

class Cau4UserController {
  final Cau4UserRepository _repository;

  Cau4UserController({Cau4UserRepository? repository})
    : _repository = repository ?? Cau4UserRepository();

  Future<Cau4UserModel> getUserInfo() {
    return _repository.fetchUserInfo();
  }

  Future<Cau4UserModel> updateUserInfo({required Cau4UserModel user}) {
    return _repository.updateUserInfo(user: user);
  }
}
