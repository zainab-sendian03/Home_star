import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_star_app/features/familyHub/controllers/family_hub_controller.dart';
import 'package:home_star_app/features/familyHub/models/child_model.dart';
import 'package:home_star_app/features/tasks/controllers/tasks_controller.dart';
import 'package:home_star_app/features/tasks/models/task_model.dart';
import 'package:home_star_app/features/tasks/views/widgets/add_task_view.dart';

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({super.key});

  void _showCompletionDialog(BuildContext context, Task task, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Column(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Color(0xff47B4EA),
              size: 40,
            ),
            SizedBox(height: 16),
            Text(
              'تأكيد إتمام المهمة',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff47B4EA),
              ),
            ),
          ],
        ),
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            ' هل أكملت المهمة${task.name}؟',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'إلغاء',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final familyHubController = Get.find<FamilyHubController>();
                  final child = familyHubController.children.firstWhere(
                    (child) => child.id == task.childId,
                  );

                  // تحديث نقاط الطفل
                  final updatedChild = Child(
                    id: child.id,
                    name: child.name,
                    age: child.age,
                    points: child.points + task.points,
                    imagePath: child.imagePath,
                  );

                  familyHubController.updateChildPoints(updatedChild);

                  // حذف المهمة
                  Get.find<TasksController>().removeTask(index);

                  Navigator.pop(context);

                  // عرض رسالة نجاح
                  Get.snackbar(
                    'تم إتمام المهمة',
                    'تم إضافة ${task.points} نقطة إلى رصيد ${child.name}',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green.shade100,
                    colorText: Colors.white,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff47B4EA),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'تأكيد',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasksController = Get.put(TasksController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'المهام',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff47B4EA),
        automaticallyImplyLeading: false,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => tasksController.tasks.isEmpty
                    ? const Center(
                        child: Text(
                          'لا توجد مهام',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: tasksController.tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasksController.tasks[index];
                          return InkWell(
                            onTap: () =>
                                _showCompletionDialog(context, task, index),
                            child: ListTile(
                              title: Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8F9FA),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xFFE9ECEF),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  task.name,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              if (task.repeat)
                                                const Icon(
                                                  Icons.repeat,
                                                  color: Color(0xff47B4EA),
                                                  size: 20,
                                                ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${task.points} نقطة',
                                                // '${task.points} نقطة',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.amber,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              const Icon(
                                                Icons.person,
                                                color: Color(0xff47B4EA),
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                task.childName,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff47B4EA),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                task.time,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              const Icon(
                                                Icons.calendar_today,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                task.date,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.grey),
                                      onPressed: () {
                                        tasksController.removeTask(index);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddTaskView());
        },
        backgroundColor: const Color(0xff47B4EA),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
