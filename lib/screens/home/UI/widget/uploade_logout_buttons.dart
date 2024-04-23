import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simply_app/core/utils/common_functions.dart';
import 'package:simply_app/core/utils/extintions.dart';
import 'package:simply_app/core/utils/styles.dart';
import 'package:simply_app/routs/routs_names.dart';
import 'package:simply_app/screens/home/logic/home_cubit.dart';

import '../../../../core/utils/colors.dart';

class UploadAndLogoutButtons extends StatelessWidget {
  const UploadAndLogoutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildContainer(
                Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 5,
                    surfaceTintColor: AppColors.shadowUploadColor,
                    shadowColor: AppColors.shadowLogoutColor,
                    child: SvgPicture.asset(
                      'assets/svgs/logout_icon.svg',
                    )),
                'Log out')
            .onTap(() {
          context.read<HomeCubit>().logout();
          context.navigateToAndReplacement(RouteName.LOGIN);
        }),
        buildContainer(
                Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 5,
                    surfaceTintColor: AppColors.shadowUploadColor,
                    shadowColor: AppColors.shadowUploadColor,
                    child: SvgPicture.asset(
                      'assets/svgs/upload_icon.svg',
                    )),
                'Upload')
            .onTap(() => showBlurredDialog(context)),
      ],
    );
  }

  void showBlurredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Prevents closing on tap outside
        return Dialog(
          backgroundColor: AppColors.whiteColor.withOpacity(.4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                decoration: BoxDecoration(
                  // Background color for the dialog
                  borderRadius: BorderRadius.circular(32),
                  // Border radius for the dialog
                  border: Border.all(
                    color: AppColors.whiteColor, // Color of the border
                    width: 1, // Width of the border
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin:
                          const EdgeInsets.only(left: 50, right: 50, top: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.galleryColorUpload),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svgs/gallery.svg'),
                          Text(
                            'Gallery',
                            style: TextStyles.font27GreyBold,
                          ),
                        ],
                      ),
                    ),
                    heightSpace(30),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin: const EdgeInsets.only(
                          left: 50, right: 50, bottom: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.cameraColorUpload),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/svgs/camera.png',
                            height: 40,
                          ),
                          Text(
                            'Camera',
                            style: TextStyles.font27GreyBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      barrierColor: Colors.transparent,
    );
  }

  Container buildContainer(Widget icon, String text) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteColor,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        icon,
        widthSpace(9),
        Text(
          text,
          style: TextStyles.font20greySemiBold,
        ),
      ]),
    );
  }
}
