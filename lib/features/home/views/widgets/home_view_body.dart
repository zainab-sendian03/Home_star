import 'package:flutter/material.dart';
import 'package:home_star_app/features/familyHub/views/family_hub_view.dart';
import 'package:home_star_app/features/rewards/views/rewards_view.dart';
import 'package:home_star_app/features/tasks/views/tasks_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FamilyHubView(),
    const TasksView(),
    const RewardsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedItemColor: const Color(0xFF2196F3), // Material Blue
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/logo.png',
                  height: 24,
                  width: 24,
                ),
                label: 'الرئيسية',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'المهام',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                label: 'المكافآت',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
