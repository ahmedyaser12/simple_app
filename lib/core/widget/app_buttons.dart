import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/common_functions.dart';

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

Widget secondaryButton(String title, {String? image}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: AppColors.secondary,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null)
          Image.asset(
            image,
            width: 20,
            height: 20,
          ),
        if (image != null) widthSpace(6),
        Text(
          title,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  );
}
