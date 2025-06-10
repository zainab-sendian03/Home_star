import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_star_app/core/routes/app_pages.dart';
import 'package:home_star_app/core/themes/assets.dart';
import 'package:home_star_app/features/on_boarding/views/widgets/build_dot.dart';
import 'package:home_star_app/features/on_boarding/views/widgets/on_boarding_page.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': Assets.assetsImagesOnboarding1,
      'title': 'تحويل الروتين إلى مغامرة ',
      'subtitle':
          'مرحبًا بكم في عالم نجم البيت!  \n حيث المهام اليومية تصبح ألعابًا،  \n والنجوم تُكافِئ كل إنجاز صغير ',
    },
    {
      'image': Assets.assetsImagesOnboarding2,
      'title': ' كيف يعمل؟ ببساطة!',
      'subtitle':
          'اختاروا المهام المناسبة لعمر طفلكم:  \n تنظيف الأسنان   \n ترتيب الغرفة   \n حفظ دعاء   \n كل مهمة... نجوم تنتظر الفوز! ✨ ',
    },
    {
      'image': Assets.assetsImagesOnboarding3,
      'title': 'عيش بأسلوبك',
      'subtitle': 'صمم حياتك بطريقتك الخاصة.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return OnBoardingPage(
                  image: data['image']!,
                  title: data['title']!,
                  subtitle: data['subtitle']!,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 45.h,
                  width: 110.w,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < onboardingData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Get.offAllNamed(AppPages.signin);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff47B4EA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                    ),
                    child: Text(
                      _currentPage < onboardingData.length - 1
                          ? 'التالي'
                          : 'ابدأ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    onboardingData.length,
                    (index) => buildDot(index == _currentPage),
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
