import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_app/core/utils/common_functions.dart';
import 'package:simply_app/core/utils/styles.dart';
import 'package:simply_app/core/widget/app_buttons.dart';
import 'package:simply_app/screens/login_screen/logic/login_cubit.dart';
import 'package:simply_app/screens/login_screen/ui/widget/email_and_password.dart';
import 'package:simply_app/services/services_locator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LoginCubit>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 175, bottom: 43),
                  child: Text(
                    'My \nGellary',
                    style: TextStyles.font50GreyBold,
                    textAlign: TextAlign.center,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 45, bottom: 45, left: 20, right: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('LOG IN', style: TextStyles.font30GreyBold),
                            heightSpace(15),
                            EmailAndPasswordField(
                              loginCubitObject: context.read<LoginCubit>(),
                            ),
                            const SizedBox(height: 20),
                            primaryButton(
                                title: 'SUBMIT',
                                borderRadius: 10,
                                verticalHeight: 10)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
