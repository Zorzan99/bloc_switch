import 'package:bloc_switch/models/task_model.dart';

abstract interface class HomeRepository {
  Future<TaskModel> addTask(String userId, TaskModel task);
  Future<List<TaskModel>> getTasks(String userId);
  Future<void> deleteTask(String userId, TaskModel taskId);
  Future<void> editTask(String userId, TaskModel editedTask);
}
