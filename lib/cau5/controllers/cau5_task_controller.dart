import '../data/models/cau5_task_model.dart';
import '../data/repository/cau5_task_repository.dart';

class Cau5TaskController {
  final Cau5TaskRepository _repository;

  Cau5TaskController({Cau5TaskRepository? repository})
    : _repository = repository ?? Cau5TaskRepository();

  Future<List<Cau5TaskModel>> getTasks() {
    return _repository.fetchTasks();
  }

  Future<void> deleteTask(int taskId) {
    return _repository.deleteTask(taskId);
  }
}
