import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login_feature/core/services/api_service.dart';
import 'package:login_feature/core/services/dio_consumer.dart';
import 'package:login_feature/features/login/data/repos/login_repo.dart';
import 'package:login_feature/features/login/data/repos/login_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerSingleton<LoginRepo>(
    LoginRepoImpl(apiService: getIt<ApiService>()),
  );
}
