import 'package:flutter/material.dart';
import 'package:login_feature/core/services/prefs.dart';

import 'core/services/service_locator.dart';
import 'features/login/presentation/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          primary: Colors.blueAccent,
        ),
      ),
      home: const LoginView(),
    );
  }
}
