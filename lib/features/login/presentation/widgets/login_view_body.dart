import 'package:flutter/material.dart';
import 'package:login_feature/core/utils/app_assets.dart';
import 'package:login_feature/features/login/presentation/widgets/login_form.dart';
import 'package:svg_flutter/svg.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          const Text(
            "Welcome Back",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(AppAssets.imagesLogin),
          const LoginForm(),
        ],
      ),
    );
  }
}
