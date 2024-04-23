import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../utils/common_functions.dart';
import '../utils/styles.dart';

class FormTextFieldItem extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? title;
  final String? name;
  final String? hint;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool? isSecure;
  final bool? isPassword;
  final bool optional = false;
  final int? lines;
  final Widget? suffixIcon;
  final Function(String)? validator;

  const FormTextFieldItem({
    super.key,
    this.controller,
    this.initialValue,
    this.title,
    this.name = '',
    this.hint,
    this.enabled,
    this.lines,
    this.suffixIcon,
    this.isSecure = false,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: name!.isEmpty
              ? Text(
                  name!,
                  style: TextStyles.font15BlackMedium,
                )
              : null,
        ),
       // if (title != null) heightSpace(8),
        Center(
          child: TextFormField(
            validator: (value) {
              return validator!(value!);
            },
            initialValue: initialValue,
            controller: controller,
            keyboardType: keyboardType,
            //style: TextStyles.font14PrimarySemi,
            decoration: InputDecoration(
              filled: true,  // Enable filling the box
              fillColor: AppColors.backgroundColorTextField,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.backgroundColorTextField,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.backgroundColorTextField,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.redColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.redColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              border: InputBorder.none,
              hintText: hint ?? title ?? "hint",
              hintStyle: TextStyle(
                color: AppColors.lightGery,
              ),
              suffixIcon: suffixIcon,
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
              isDense: true,
            ),
            maxLength: lines,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            enabled: enabled,
            obscureText: isPassword == true ? isSecure! : false,
          ),
        ),
      ],
    );
  }
}
