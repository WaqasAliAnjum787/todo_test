import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/controllers/todo_controller.dart';
import 'package:todo/app/modules/due_date/complete_view.dart';
import 'package:todo/app/modules/due_date/due_date_todo_view.dart';

class ProgessView extends StatelessWidget {
  const ProgessView({super.key});

  TodoController get todoController => Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Due Date'),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_rounded),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Completed'),
              Tab(text: 'Due Date'),
            ],
          ),
        ),
        body: TabBarView(
          children: [CompleteTodoView(), DueDateView()],
        ),
      ),
    );
  }
}
