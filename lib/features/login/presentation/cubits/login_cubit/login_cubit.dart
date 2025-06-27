import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_feature/features/login/data/models/login_request_model.dart';
import 'package:login_feature/features/login/data/repos/login_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;

  Future<void> login(LoginRequestModel loginRequestModel) async {
    emit(LoginLoading());
    final result = await loginRepo.login(loginRequestModel);
    result.fold(
      (l) => emit(LoginError(l.errMessage)),
      (r) => emit(LoginSuccess()),
    );
  }
}
