import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget primaryButton(
    {required String title,
    required double borderRadius,
    double verticalHeight = 20}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: verticalHeight),
    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: FittedBox(
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
