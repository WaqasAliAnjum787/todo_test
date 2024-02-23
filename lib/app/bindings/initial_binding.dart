import 'package:get/get.dart';
import 'package:todo/app/controllers/todo_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodoController(), permanent: true);
  }
}
