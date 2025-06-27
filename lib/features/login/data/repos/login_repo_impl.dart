import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:login_feature/core/constants/end_points.dart';
import 'package:login_feature/core/errors/exception.dart';
import 'package:login_feature/core/errors/failure.dart';
import 'package:login_feature/core/services/api_service.dart';
import 'package:login_feature/core/services/prefs.dart';
import 'package:login_feature/features/login/data/models/login_request_model.dart';
import 'package:login_feature/features/login/data/models/user_model.dart';
import 'package:login_feature/features/login/data/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;

  LoginRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, void>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await apiService.post(
        EndPoints.login,
        data: loginRequestModel.toJson(),
      );
      final UserModel userModel = UserModel.fromJson(response);
      saveUserData(userModel);
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  saveUserData(UserModel userModel) {
    final encoded = jsonEncode(userModel);
    Prefs.setString('userData', encoded);
  }
}
