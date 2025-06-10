import 'package:get/get.dart';
import 'package:home_star_app/core/routes/app_pages.dart';
import 'package:home_star_app/features/auth/views/sign_in_view.dart';
import 'package:home_star_app/features/auth/views/sign_up_view.dart';
import 'package:home_star_app/features/familyHub/views/add_child_view.dart';
import 'package:home_star_app/features/home/views/home_view.dart';
import 'package:home_star_app/features/on_boarding/views/on_boarding_view.dart';
import 'package:home_star_app/features/profile/view/profile_child_view.dart';
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
    GetPage(
      name: AppPages.signin,
      page: () => const SignInView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppPages.signup,
      page: () => const SignUpView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppPages.home,
      page: () => const HomeView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppPages.addChild,
      page: () => const AddChildView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppPages.profile,
      page: () => const ProfileChildView(),
      transition: Transition.rightToLeft,
    ),
    // Add more GetPages here
  ];
}
