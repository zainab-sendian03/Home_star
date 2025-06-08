import 'package:get/get.dart';
import 'package:home_star_app/core/routes/app_pages.dart';
import 'package:home_star_app/features/splash/views/splash_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: AppPages.splash,
      page: () => const SplashView(),
    ),

    // Add more GetPages here
  ];
}
