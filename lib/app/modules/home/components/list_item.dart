import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
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
      height: 80.h,
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
        color: Colors.blue.shade400,
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
                    Text(
                      getPriority(todo.priority).name.capitalizeFirst ?? '',
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
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        todoController.deleteTodo(todo);
                      },
                      icon: Icon(Icons.delete)),
                  InkWell(
                    onTap: () {
                      todoController.markAsCompleted(todo);
                    },
                    child: Container(
                      child: todo.isCompleted
                          ? Icon(Icons.check_circle_outline_rounded)
                          : Icon(Icons.radio_button_unchecked_rounded),
                    ),
                  )
                ],
              )),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          // Row(
          //   children: [
          // Container(
          //   decoration: BoxDecoration(
          //       color: AppColors.kOrange,
          //       borderRadius: BorderRadius.all(Radius.circular(6))),
          //   padding: EdgeInsets.all(
          //     4,
          //   ),
          //   child: Text(
          //     getPriority(todo.priority).name,
          //   ),
          // ),
          //     Row(
          //       children: List.generate(4, (index) {
          //         if (getPriority(todo.priority) == Priority.low) {
          //           return Container(
          //             height: 10,
          //             width: 20,
          //             decoration: BoxDecoration(
          //               color: index == 0 ? Colors.red.shade300 : Colors.grey,
          //               borderRadius: BorderRadius.only(
          //                 bottomLeft: Radius.circular(50),
          //               ),
          //             ),
          //           );
          //         } else {
          //           if (getPriority(todo.priority) == Priority.medium) {
          //             return Container(
          //               color: index <= 1 ? Colors.red.shade500 : Colors.grey,
          //             );
          //           } else {
          //             if (getPriority(todo.priority) == Priority.high) {
          //               return Container(
          //                 color: index <= 1 ? Colors.red.shade700 : Colors.grey,
          //               );
          //             }
          //             return Container(
          //               color: Colors.red,
          //             );
          //           }
          //         }
          //       }),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
