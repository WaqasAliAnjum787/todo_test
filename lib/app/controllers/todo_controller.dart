// import 'package:get/get.dart';
// import 'package:todo/app/models/todo_model.dart';
// import 'package:todo/app/services/database_service.dart';

// class TodoController extends GetxController {
//   final db = DatabaseService();
//   RxList<TodoModel> todos = RxList<TodoModel>();
//   List<TodoModel> listOfTodos = [];

//   @override
//   void onInit() {
//     super.onInit();
//     // ignore: invalid_use_of_protected_member
//     listOfTodos = todos.value;
//     getTodosStream();
//   }

//   void getTodosStream() {
//     db.todoCollection.snapshots().listen((snapshot) {
//       todos.assignAll(snapshot.docs
//           .map((doc) => TodoModel.fromMap(doc.data() as Map<String, dynamic>))
//           .toList());
//     });
//   }

//   Future<void> addTodo(TodoModel todo) async {
//     await db.todoCollection.add(todo.toMap());
//   }

//   Future<void> updateTodo(TodoModel todo) async {
//     await db.todoCollection.doc(todo.id).update(todo.toMap());
//   }

//   Future<void> deleteTodo(String todoId) async {
//     await db.todoCollection.doc(todoId).delete();
//   }
// }

import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:todo/app/database/todo_database.dart';
import 'package:todo/app/models/todo_model.dart';

class TodoController extends GetxController {
  final TodoDatabase todoDb = TodoDatabase();
  Rx<List<TodoModel>> todos = Rx<List<TodoModel>>([]);
  Rx<List<TodoModel>> overDueTodos = Rx<List<TodoModel>>([]);
  Rx<List<TodoModel>> completedTodos = Rx<List<TodoModel>>([]);

  @override
  void onInit() {
    todos.bindStream(todoDb.getTodosStream());
    overDueTodos.bindStream(todoDb.getTodosOverDueDateStream());
    completedTodos.bindStream(todoDb.getTodosHasCompletedStream());
    super.onInit();
  }

  void addTodo(TodoModel todo, File? file) async {
    await todoDb.addTodo(todo, file);
  }

  void updateTodo(TodoModel todo, File? file) async {
    await todoDb.updateTodo(todo, file);
  }

  void deleteTodo(TodoModel todo) async {
    await todoDb.deleteTodo(todo.id);
  }

  void markAsCompleted(TodoModel todo) async {
    await todoDb.markAsComplete(todo);
  }
}
