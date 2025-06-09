import 'package:flutter/material.dart';
import 'package:home_star_app/features/auth/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInViewBody(),
    );
  }
}
