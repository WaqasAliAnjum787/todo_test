import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:todo/app/controllers/todo_controller.dart';
import 'package:todo/app/data/data/app_constents.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/modules/widgets/custom_drop_down.dart';
import 'package:todo/app/modules/widgets/image_picker_container.dart';
import 'package:todo/app/modules/widgets/primary_button.dart';
import 'package:todo/app/services/date_and_time_service.dart';

class AddOrUpdateTodo extends StatefulWidget {
  final bool isInEditMode;
  final TodoModel? todo;
  const AddOrUpdateTodo({super.key, this.isInEditMode = false, this.todo});
  @override
  _AddOrUpdateTodoState createState() => _AddOrUpdateTodoState();
}

class _AddOrUpdateTodoState extends State<AddOrUpdateTodo> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController title = TextEditingController();
  final TextEditingController dicription = TextEditingController();
  final TextEditingController priority = TextEditingController();
  final TextEditingController difficultiLevel = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController dueDate = TextEditingController();
  final controller = BoardDateTimeController();
  var file;
  DateAndTimeService dateAndTimeService = DateAndTimeService();

  TodoController get todoController => Get.find<TodoController>();
  DateTime? date;

  @override
  void initState() {
    if (widget.isInEditMode == true && widget.todo != null) {
      title.text = widget.todo!.title;
      dicription.text = widget.todo!.description;
      priority.text = widget.todo!.priority;
      dueDate.text = dateAndTimeService
          .convertToDateTime(widget.todo!.dueDate!)
          .toString()
          .substring(0, 10);
    }
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    dicription.dispose();
    priority.dispose();
    time.dispose();
    dueDate.dispose();
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isInEditMode ? 'Update Todo' : 'Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: ImagePickerContainer(
                      imageUrl:
                          widget.isInEditMode && widget.todo!.imageUrl != null
                              ? widget.todo?.imageUrl
                              : null,
                      onImagePicked: (value) {
                        file = value;
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    controller: title,
                    decoration:
                        InputDecoration(labelText: 'Title', hintText: "Title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    maxLines: 5,
                    controller: dicription,
                    decoration: InputDecoration(
                        labelText: 'Discription',
                        hintText: "Discription",
                        filled: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter discription';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter due date of task';
                      }
                      return null;
                    },
                    readOnly: true,
                    controller: dueDate,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Select Due Date",
                        isDense: true),
                    onTap: () async {
                      var result =
                          await dateAndTimeService.showTimerPicker(context);
                      if (result != null) {
                        dueDate.text =
                            dateAndTimeService.convertToString(result);
                        setState(() {
                          date = result;
                        });
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: CustomDropDown(
                    value: widget.isInEditMode == true
                        ? widget.todo!.difficulityLevel
                        : null,
                    items: DifficulityLevel.values.map((e) => e.name).toList(),
                    hint: "Select Difficulity level of task",
                    onChanged: (p0) {
                      difficultiLevel.text = p0 ?? '';
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: CustomDropDown(
                    value: widget.isInEditMode == true
                        ? widget.todo!.priority
                        : null,
                    items: Priority.values.map((e) => e.name).toList(),
                    hint: "Select Priority level of task",
                    onChanged: (p0) {
                      priority.text = p0 ?? '';
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: addOrUpdateButton(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PrimaryButton addOrUpdateButton() {
    return PrimaryButton(
        onTap: () async {
          if (_formKey.currentState!.validate()) {
            if (widget.isInEditMode) {
              todoController.updateTodo(
                  TodoModel(
                      id: widget.todo!.id,
                      creationData: widget.todo!.creationData,
                      description: dicription.text,
                      title: title.text,
                      difficulityLevel: difficultiLevel.text,
                      isCompleted: false,
                      priority: priority.text,
                      status: '',
                      dueDate: date!.millisecondsSinceEpoch),
                  file);
              Get.snackbar("Task Updated", "Task Updated Successfully");
            } else {
              todoController.addTodo(
                TodoModel(
                    id: '',
                    creationData: 0,
                    description: dicription.text,
                    title: title.text,
                    difficulityLevel: difficultiLevel.text,
                    isCompleted: false,
                    priority: priority.text,
                    status: '',
                    dueDate: date!.millisecondsSinceEpoch),
                file,
              );
              Get.snackbar("Task Created", "Task Created Successfully");
            }
          }
        },
        text: widget.isInEditMode ? "Update" : "Create Task");
  }
}
