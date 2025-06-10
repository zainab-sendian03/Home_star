import 'package:flutter/material.dart';
import 'package:home_star_app/core/themes/assets.dart';

class ProfileChildViewBody extends StatelessWidget {
  const ProfileChildViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFF5E6D3),
                      border: Border.all(
                        color: const Color(0xFFE0D0C0),
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        Assets.assetsImagesAvatar,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.brown,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // User Name
                  const Text(
                    'Ethan',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Age
                  const Text(
                    'Age 7',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Stars
                  const Text(
                    '150 Stars',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Completed Tasks Section
            const Text(
              'Completed Tasks',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            const CompletedTaskCard(
              taskName: 'Brush Teeth',
              completedDate: 'Completed: 08/15/2024, 9:00 AM',
              routine: 'Morning Routine',
            ),
            const SizedBox(height: 12),

            const CompletedTaskCard(
              taskName: 'Homework',
              completedDate: 'Completed: 08/15/2024, 3:30 PM',
              routine: 'Afternoon Routine',
            ),
            const SizedBox(height: 12),

            const CompletedTaskCard(
              taskName: 'Pack Backpack',
              completedDate: 'Completed: 08/15/2024, 8:00 PM',
              routine: 'Evening Routine',
            ),
            const SizedBox(height: 40),

            // To-Do Tasks Section
            const Text(
              'To-Do Tasks',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            const ToDoTaskCard(
              taskName: 'Make Bed',
              scheduledDate: 'Scheduled: 08/16/2024, 7:00 AM',
              reminder: 'Reminder: 6:50 AM',
              routine: 'Morning Routine',
            ),
            const SizedBox(height: 12),

            const ToDoTaskCard(
              taskName: 'Practice Piano',
              scheduledDate: 'Scheduled: 08/16/2024, 4:00 PM',
              reminder: 'Reminder: 3:50 PM',
              routine: 'Afternoon Routine',
            ),
            const SizedBox(height: 12),

            const ToDoTaskCard(
              taskName: 'Read a Book',
              scheduledDate: 'Scheduled: 08/16/2024, 9:00 PM',
              reminder: 'Reminder: 8:50 PM',
              routine: 'Evening Routine',
            ),
            const SizedBox(height: 100), // Space for bottom navigation
          ],
        ),
      ),
    );
  }
}

class CompletedTaskCard extends StatelessWidget {
  final String taskName;
  final String completedDate;
  final String routine;

  const CompletedTaskCard({
    super.key,
    required this.taskName,
    required this.completedDate,
    required this.routine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Checkmark Icon
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Color(0xFF28A745),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 16),
          // Task Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  completedDate,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  routine,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ToDoTaskCard extends StatelessWidget {
  final String taskName;
  final String scheduledDate;
  final String reminder;
  final String routine;

  const ToDoTaskCard({
    super.key,
    required this.taskName,
    required this.scheduledDate,
    required this.reminder,
    required this.routine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // List Icon
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.format_list_bulleted,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 16),
          // Task Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$scheduledDate, $reminder',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  routine,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
