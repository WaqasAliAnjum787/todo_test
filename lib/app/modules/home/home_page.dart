import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/app/controllers/todo_controller.dart';
import 'package:todo/app/data/data/app_assets.dart';
import 'package:todo/app/data/data/app_typography.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/modules/home/components/list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  TodoController get todoController => Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              'TaskBuddy',
              style: AppTypography.kBold18,
            ),
            floating: true,
            snap: true,
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(),
          ),
          Obx(
            () => todoController.todos.value.length != 0
                ? SliverList.builder(
                    itemCount: todoController.todos.value.length,
                    itemBuilder: (context, int) {
                      final TodoModel todo = todoController.todos.value[int];
                      return ListItem(
                        todo: todo,
                      );
                    },
                  )
                : Container(
                    height: 250.h,
                    width: 250.h,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Lottie.asset(
                      AppAssets.noDataAnimation,
                      fit: BoxFit.fill,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
