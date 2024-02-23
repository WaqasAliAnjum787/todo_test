import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/app/controllers/todo_controller.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/modules/home/components/list_item.dart';

class CompleteTodoView extends StatelessWidget {
  const CompleteTodoView({super.key});
  TodoController get todoController => Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => todoController.completedTodos.value.length == 0
          ? Center(
              child: Container(
                height: 250.h,
                width: 250.h,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Lottie.asset(
                  'assets/animations/no_data_found_animation.json',
                  fit: BoxFit.fill,
                ),
              ),
            )
          : ListView.builder(
              itemCount: todoController.completedTodos.value.length,
              itemBuilder: (context, int) {
                final TodoModel todo = todoController.todos.value[int];
                return ListItem(
                  todo: todo,
                );
              },
            ),
    );
  }
}
