import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/app/data/data/app_colors.dart';
import 'package:todo/app/data/data/app_typography.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTypography.kLight14.copyWith(
          color: AppColors.kPrimary,
          fontSize: fontSize ?? 14.sp,
        ),
      ),
    );
  }
}