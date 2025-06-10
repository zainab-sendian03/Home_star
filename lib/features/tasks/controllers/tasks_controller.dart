import 'package:get/get.dart';
import 'package:home_star_app/features/tasks/models/task_model.dart';

class TasksController extends GetxController {
  final tasks = <Task>[].obs;

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void updateTask(int index, Task task) {
    tasks[index] = task;
  }
}
