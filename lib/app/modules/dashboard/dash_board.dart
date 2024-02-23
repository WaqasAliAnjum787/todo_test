import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/controllers/todo_controller.dart';
import 'package:todo/app/modules/add_todo/add_to_view.dart';
import 'package:todo/app/modules/dashboard/components/botton_navigation_bar.dart';
import 'package:todo/app/modules/due_date/due_date_view.dart';
import 'package:todo/app/modules/home/home_page.dart';
import 'package:todo/app/modules/search/search_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TodoController get todoController => Get.find<TodoController>();

  List<Widget> listOfPages = [
    HomePage(),
    ProgessView(),
    SearchView(),
    AddOrUpdateTodo(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CustomBottomNavigationBar(onTap: (int index) {
          setState(() {
            this.index = index;
          });
        }),
        body: listOfPages[index]);
  }
}
