import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_feature/core/services/service_locator.dart';
import 'package:login_feature/features/login/data/repos/login_repo.dart';
import 'package:login_feature/features/login/presentation/widgets/login_view_body.dart';

import '../cubits/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepo>()),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: LoginViewBody(),
          ),
        ),
      ),
    );
  }
}
