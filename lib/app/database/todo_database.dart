import 'dart:io';

import 'package:get/get.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/modules/widgets/loading_dialogs.dart';
import 'package:todo/app/services/database_service.dart';
import 'package:todo/app/services/storage_service.dart';

class TodoDatabase {
  final db = DatabaseService();

  Stream<List<TodoModel>> getTodosStream() {
    return db.todoCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => TodoModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Future<void> addTodo(TodoModel todo, File? file) async {
    if (file != null) {
      LoadingDialog.showErrorDialog(message: 'Uploading...');
      String imageUrl =
          await uploadToStorage(file: file, folderName: 'todoImages');
      var doc = db.todoCollection.doc();
      todo.id = doc.id;
      todo.imageUrl = imageUrl;

      todo.creationData = DateTime.now().millisecondsSinceEpoch;
      await db.todoCollection.doc(doc.id).set(todo.toMap());
      LoadingDialog.hideLoadingDialog();
    } else {
      LoadingDialog.showErrorDialog(message: 'Uploading...');
      var doc = db.todoCollection.doc();
      todo.id = doc.id;

      todo.creationData = DateTime.now().millisecondsSinceEpoch;
      await db.todoCollection.doc(doc.id).set(todo.toMap());
      Get.snackbar("Task Created", "Task Created Successfully");
      LoadingDialog.hideLoadingDialog();
    }
  }

  Future<void> updateTodo(TodoModel todo, File? file) async {
    LoadingDialog.showErrorDialog(message: 'Uploading...');
    if (file != null) {
      //checking if todo already has image then we will delete that image and upload new one
      if (todo.imageUrl != null) {
        await deleteImageFromLink(todo.imageUrl!);
      }
      String imageUrl =
          await uploadToStorage(file: file, folderName: 'todoImages');
      todo.imageUrl = imageUrl;
      await db.todoCollection.doc(todo.id).update(todo.toMap());
      LoadingDialog.hideLoadingDialog();
    }
    return await db.todoCollection.doc(todo.id).update(todo.toMap());
  }

  Future<void> deleteTodo(String id) async {
    return await db.todoCollection.doc(id).delete();
  }

  Future<void> markAsComplete(TodoModel todo) async {
    if (todo.isCompleted) {
      await db.todoCollection.doc(todo.id).update({'isCompleted': false});
    } else {
      await db.todoCollection.doc(todo.id).update({'isCompleted': true});
    }
  }

  Stream<List<TodoModel>> getTodosOverDueDateStream() {
    return db.todoCollection
        .where('dueDate', isLessThan: DateTime.now().millisecondsSinceEpoch)
        .orderBy('dueDate')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => TodoModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Stream<List<TodoModel>> getTodosHasCompletedStream() {
    return db.todoCollection
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => TodoModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }
}
