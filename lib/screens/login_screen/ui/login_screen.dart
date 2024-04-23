import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_app/core/utils/common_functions.dart';
import 'package:simply_app/core/utils/extintions.dart';
import 'package:simply_app/core/utils/styles.dart';
import 'package:simply_app/core/widget/app_buttons.dart';
import 'package:simply_app/routs/routs_names.dart';
import 'package:simply_app/screens/login_screen/logic/login_cubit.dart';
import 'package:simply_app/screens/login_screen/ui/widget/email_and_password.dart';

import '../../../core/utils/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                          child: BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is LoginFailure) {
                                showAlertDialog(context, state.error!);
                              }
                              if (state is LoginSuccess) {
                                context.navigateTo(RouteName.HOME);
                                showAcceptDialog(context, 'Login Successful');
                              }
                            },
                            builder: (context, state) {
                              return Container(
                                padding: const EdgeInsets.only(
                                    top: 30, bottom: 45, left: 20, right: 20),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32.0),
                                  color: Colors.white.withOpacity(0.4),
                                ),
                                child: Center(
                                  child: state is LoginLoading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text('LOG IN',
                                                style:
                                                    TextStyles.font30GreyBold),
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
                                                .onTap(() {
                                              context
                                                  .read<LoginCubit>()
                                                  .login();
                                            })
                                          ],
                                        ),
                                ),
                              );
                            },
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
