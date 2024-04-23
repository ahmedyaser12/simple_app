import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/cache_helper.dart';
import '../../../core/utils/status.dart';
import '../../../services/api_services/api_service.dart';
import '../../../services/api_services/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  ApiService apiService;

  LoginCubit(this.apiService) : super(LoginInitial());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      var response = await apiService.signIn(
          email: emailController.text, password: passwordController.text);
      if (response.status == Status.SUCCESS) {
        CacheHelper().saveData(key: ApiKey.token, value: response.data!.token);
        CacheHelper().saveData(key: 'login', value: true);

        emit(LoginSuccess());
      } else {
        emit(
            LoginFailure(response.errorMessage ?? "An unknown error occurred"));
      }
    }
  }
}
