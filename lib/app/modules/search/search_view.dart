import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/controllers/todo_controller.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/modules/home/components/list_item.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();
  TodoController get todoController => Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    List<TodoModel> searchResults = todoController.todos.value
        .where((todo) => todo.title
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Search')),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: TextField(
                controller: searchController,
                autocorrect: true,
                decoration: InputDecoration(labelText: 'Search'),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            ListView.builder(
              itemCount: searchResults.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final TodoModel todo = searchResults[index];
                return ListItem(
                  todo: todo,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
