import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_app/core/utils/common_functions.dart';
import 'package:simply_app/core/utils/styles.dart';
import 'package:simply_app/core/widget/app_buttons.dart';
import 'package:simply_app/screens/login_screen/logic/login_cubit.dart';
import 'package:simply_app/screens/login_screen/ui/widget/email_and_password.dart';
import 'package:simply_app/services/services_locator.dart';

import '../../../core/utils/assets.dart';

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
              AssetsManager.backgroundLogin,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        'My\nGellary',
                        style: TextStyles.font50GreyBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 38),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 30, bottom: 45, left: 20, right: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.0),
                              color: Colors.white.withOpacity(0.4),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text('LOG IN',
                                      style: TextStyles.font30GreyBold),
                                  heightSpace(10),
                                  EmailAndPasswordField(
                                    loginCubitObject:
                                        context.read<LoginCubit>(),
                                  ),
                                  heightSpace(25),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
