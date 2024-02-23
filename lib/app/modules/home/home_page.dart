import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/controllers/todo_controller.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/modules/home/components/list_item.dart';
import 'package:todo/app/modules/home/components/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  TodoController get todoController => Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        UserCard(),
        Obx(
          () => SliverList.builder(
            itemCount: todoController.todos.value.length,
            itemBuilder: (context, int) {
              final TodoModel todo = todoController.todos.value[int];
              return ListItem(
                todo: todo,
              );
            },
          ),
        )
      ],
    );
  }
}
