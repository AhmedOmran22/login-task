import 'package:dartz/dartz.dart';
import 'package:login_feature/core/errors/failure.dart';
import 'package:login_feature/features/login/data/models/login_request_model.dart';
import 'package:login_feature/features/login/data/models/user_model.dart';

abstract class LoginRepo {
    Future<Either<Failure, void>> login(LoginRequestModel loginRequestModel);
    saveUserData(UserModel userModel);
}
