import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    this.size = 20,
    this.color = AppColors.primary,
    super.key,
  });

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 1.4.w,
        ),
      ),
    );
  }
}
