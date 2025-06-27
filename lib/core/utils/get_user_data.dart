import 'dart:convert';

import 'package:login_feature/core/services/prefs.dart';
import 'package:login_feature/features/login/data/models/user_model.dart';

UserModel getUserData() {
  final data = Prefs.getString('userData');
  return UserModel.fromJson(jsonDecode(data!));
}
