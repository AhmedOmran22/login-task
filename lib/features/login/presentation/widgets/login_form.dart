import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_buton.dart';
import '../../../../core/widgets/custom_passwrd_field.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../data/models/login_request_model.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../cubits/login_cubit/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        spacing: 16,
        children: [
          CustomTextFormField(
            hintText: "User Name",
            controller: userNameController,
          ),
          CustomPasswordField(
            hintText: "Password",
            controller: passwordController,
          ),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (BuildContext context, LoginState state) {
              if (state is LoginError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Login Success")));
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              }
              return CustomButton(
                text: "Login",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    final loginRequestModel = LoginRequestModel(
                      userName: userNameController.text,
                      password: passwordController.text,
                    );
                    context.read<LoginCubit>().login(loginRequestModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
