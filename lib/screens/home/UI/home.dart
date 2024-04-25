import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_app/core/utils/colors.dart';
import 'package:simply_app/core/utils/common_functions.dart';
import 'package:simply_app/screens/home/UI/widget/uploade_list.dart';
import 'package:simply_app/screens/home/UI/widget/uploade_logout_buttons.dart';
import 'package:simply_app/screens/home/logic/home_cubit.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset(
              AssetsManager.backgroundHome,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: CustomPaint(
                painter: ProductPainter(context: context),
              ),
            ),
            // Additional Positioned widgets for other shapes
            const Positioned(
              top: 30, // example position
              right: 19, // example position
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                    'assets/svgs/jpj1.jpg'), // replace with your image URL
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Welcome\nMina',
                    style: TextStyles.font32greySemiBold,
                    textAlign: TextAlign.start,
                  ),
                ),
                heightSpace(30),
                const UploadAndLogoutButtons(),
                heightSpace(30),
                Expanded(child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is GalleryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is GallerySuccess) {
                      return DisplayGallery(
                        model: state.galleryModel,
                      );
                    }
                    return Container();
                  },
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductPainter extends CustomPainter {
  final BuildContext context;

  ProductPainter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Paint paint = Paint()
      ..color = AppColors.whiteColor.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    var path = Path();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // Start from top left
    path.moveTo(0, 0);
    path.lineTo(width - 150, 0);
    path.quadraticBezierTo(width - 90, 10, width - 90, 50);
    path.quadraticBezierTo(width - 95, 100, width - 25, 97);
    path.quadraticBezierTo(width + 6, 100, width, 150);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(0, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
