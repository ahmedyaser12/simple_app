import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/common_functions.dart';
import '../../../../core/widget/text_field.dart';
import '../../logic/login_cubit.dart';

class EmailAndPasswordField extends StatelessWidget {
  final LoginCubit loginCubitObject;

  const EmailAndPasswordField({super.key, required this.loginCubitObject});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          FormTextFieldItem(
            controller: loginCubitObject.emailController,
            title: 'User Name',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty ||
                  value == null ||
                  !AppRegex.isEmailValid(value)) {
                return 'please entre a valid email';
              }
            },
          ),
          heightSpace(15),
          FormTextFieldItem(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 6) {
                return 'Password must be greater than 6 characters';
              }
              return null;
            },
            isPassword: true,
            controller: loginCubitObject.passwordController,
            keyboardType: TextInputType.visiblePassword,
            title: 'password',
          ),
        ],
      ),
    );
  }
}
