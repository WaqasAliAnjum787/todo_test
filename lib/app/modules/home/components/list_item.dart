import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/app/controllers/todo_controller.dart';
import 'package:todo/app/data/data/app_colors.dart';
import 'package:todo/app/data/data/app_constents.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/modules/add_todo/add_to_view.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.todo});
  final TodoModel todo;
  TodoController get todoController => Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      margin: EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title.capitalizeFirst ?? '',
                      style: TextStyle(
                          color: AppColors.kBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        'Priority:'
                        '${getPriority(todo.priority).name.capitalizeFirst ?? ''}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        'Difficulity Level:'
                        '${getDifficulityLevel(todo.difficulityLevel).name.capitalizeFirst ?? ''}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => AddOrUpdateTodo(
                              todo: todo,
                              isInEditMode: true,
                            ));
                      },
                      icon: Icon(
                        Icons.edit,
                        color: AppColors.kBackground,
                      )),
                  IconButton(
                      onPressed: () {
                        todoController.deleteTodo(todo);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: AppColors.kBackground,
                      )),
                  InkWell(
                    onTap: () {
                      todoController.markAsCompleted(todo);
                      Get.snackbar("Task Updated", "Task Updated Successfully");
                    },
                    child: Container(
                      child: todo.isCompleted
                          ? Icon(
                              Icons.check_circle_outline_rounded,
                              color: AppColors.kBackground,
                            )
                          : Icon(
                              Icons.radio_button_unchecked_rounded,
                              color: AppColors.kBackground,
                            ),
                    ),
                  )
                ],
              )),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
