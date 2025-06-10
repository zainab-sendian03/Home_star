import 'package:flutter/material.dart';
import 'package:home_star_app/core/themes/assets.dart';

class RewardViewBody extends StatelessWidget {
  const RewardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff47B4EA),
        elevation: 0,
        title: const Text(
          'الجوائز',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
            child: Text(
              'اختر الجائزة التي تريد !',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
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
                      title: 'ايس كريم',
                      points: 100,
                      color: Color(0xFFFBD0C0),
                      imagePath: Assets.assetsImagesIcecream),
                  RewardCard(
                    title: 'فيلم',
                    points: 200,
                    color: Colors.white,
                    imagePath: Assets.assetsImagesMovienight,
                    isImageDark: true,
                  ),
                  RewardCard(
                    title: 'لعبة جديدة',
                    points: 300,
                    color: Color(0xFFD8E8C5),
                    imagePath: Assets.assetsImagesToy,
                  ),
                  RewardCard(
                    title: 'زيارة الحديقة',
                    points: 150,
                    color: Color(0xFF4A7C59),
                    imagePath: Assets.assetsImagesPark,
                    isTextWhite: true,
                  ),
                  RewardCard(
                    title: 'حفلة بيتزا',
                    points: 250,
                    color: Colors.white,
                    imagePath: Assets.assetsImagesPiza,
                    hasShadow: true,
                  ),
                  RewardCard(
                    title: 'العاب فيديو',
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
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Center(child: Text('تأكيد الجائزة')),
              content: Text('هل أنت متأكد من اختيار جائزة $title؟'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'إلغاء',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'تأكيد',
                    style: TextStyle(color: Color(0xff47B4EA)),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
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
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 17,
                        ),
                        Text(
                          ' $points نقطة',
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                isTextWhite ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
