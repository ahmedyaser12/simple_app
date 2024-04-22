import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../core/helper/cache_helper.dart';
import '../../../core/utils/status.dart';
import '../../../services/api_services/api_service.dart';
import '../../../services/api_services/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiService apiServices;

  LoginCubit(this.apiServices) : super(LoginInitial());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();final formKey = GlobalKey<FormState>();

}
