import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_star_app/core/routes/app_pages.dart';
import 'package:home_star_app/core/themes/app_styles.dart';
import 'package:home_star_app/core/themes/assets.dart';

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 330.h - 20.h,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    Assets.assetsImagesOnBoardingShadow,
                    width: double.infinity,
                    height: 100.h,
                    fit: BoxFit.fill,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.r),
                    bottomRight: Radius.circular(32.r),
                  ),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: 380.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.h,
                  right: 20.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back, size: 18.sp),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(AppPages.signin);
                        },
                        child: Text(
                          'Skip',
                          style: AppStyles.f14Regular
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            55.verticalSpace,
            Text(
              title,
              style: AppStyles.f24Bold.copyWith(color: const Color(0xff47B4EA)),
            ),
            8.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                subtitle,
                style: AppStyles.f14Regular,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
