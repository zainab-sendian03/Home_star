import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:home_star_app/features/auth/views/sign_in_view_body.dart';

class HomeStar extends StatelessWidget {
  const HomeStar({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInViewBody(),
      ),
    );
  }
}
