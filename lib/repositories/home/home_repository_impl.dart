import 'dart:developer';

import 'package:bloc_switch/core/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<TaskModel> addTask(String userId, TaskModel task) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final DocumentReference documentReference = await firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .add(task.toMap());

      final TaskModel updatedTask = task.copyWith(id: documentReference.id);

      return updatedTask;
    } catch (e, s) {
      log('Erro ao salvar tarefa', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String userId, TaskModel taskId) async {
    final DocumentReference taskReference = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId
            .id); // O campo id já é do tipo String?, então não é necessário chamar .toString()

    try {
      await taskReference.delete();
    } catch (e, s) {
      log('Erro ao deletar tarefa', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> editTask(String userId, TaskModel editedTask) async {
    final DocumentReference taskReference = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(editedTask.id);

    try {
      // Atualiza os dados da tarefa no Firestore
      await taskReference.update(editedTask.toMap());
    } catch (e, s) {
      log('Erro ao editar tarefa', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<TaskModel>> getTasks(String userId) async {
    try {
      final QuerySnapshot taskSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .get();

      return taskSnapshot.docs
          .map((doc) => TaskModel.fromMap(doc.data() as Map<String, dynamic>)
              .copyWith(id: doc.id))
          .toList();
    } catch (e, s) {
      log("Error getTask", error: e, stackTrace: s);
      throw Exception("Error");
    }
  }
}
