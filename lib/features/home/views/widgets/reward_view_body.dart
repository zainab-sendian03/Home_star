import 'package:flutter/material.dart';
import 'package:home_star_app/core/themes/assets.dart';

class RewardViewBody extends StatelessWidget {
  const RewardViewBody({super.key});

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
          'Rewards',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: Text(
              'Choose a reward to work towards!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  RewardCard(
                      title: 'Ice Cream',
                      points: 100,
                      color: Color(0xFFFBD0C0),
                      imagePath: Assets.assetsImagesIcecream),
                  RewardCard(
                    title: 'Movie Night',
                    points: 200,
                    color: Color(0xFF000000),
                    imagePath: Assets.assetsImagesMovienight,
                    isImageDark: true,
                  ),
                  RewardCard(
                    title: 'New Toy',
                    points: 300,
                    color: Color(0xFFD8E8C5),
                    imagePath: Assets.assetsImagesToy,
                  ),
                  RewardCard(
                    title: 'Park Visit',
                    points: 150,
                    color: Color(0xFF4A7C59),
                    imagePath: Assets.assetsImagesPark,
                    isTextWhite: true,
                  ),
                  RewardCard(
                    title: 'Pizza Party',
                    points: 250,
                    color: Colors.white,
                    imagePath: Assets.assetsImagesPiza,
                    hasShadow: true,
                  ),
                  RewardCard(
                    title: 'Video Game',
                    points: 350,
                    color: Color(0xFFADD8E6),
                    imagePath: Assets.assetsImagesVideoGame,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final String title;
  final int points;
  final Color color;
  final String imagePath;
  final bool isTextWhite;
  final bool isImageDark;
  final bool hasShadow;

  const RewardCard({
    super.key,
    required this.title,
    required this.points,
    required this.color,
    required this.imagePath,
    this.isTextWhite = false,
    this.isImageDark = false,
    this.hasShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: isTextWhite ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$points points',
                    style: TextStyle(
                      fontSize: 12,
                      color: isTextWhite ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
