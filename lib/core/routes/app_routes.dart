import 'package:get/get.dart';
import 'package:home_star_app/core/routes/app_pages.dart';
import 'package:home_star_app/features/on_boarding/views/on_boarding_view.dart';
import 'package:home_star_app/features/splash/views/splash_view.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: AppPages.splash,
      page: () => const SplashView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppPages.onboarding,
      page: () => const OnBoardingView(),
      transition: Transition.rightToLeft,
    ),

    // Add more GetPages here
  ];
}
