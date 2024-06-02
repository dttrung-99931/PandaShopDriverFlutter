// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/diemsions/size_extensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';

class Section extends StatelessWidget {
  static final EdgeInsets defaultMargin =
      EdgeInsets.only(top: r8, left: r8, right: r8);
  final Widget child;
  final String? title;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final double spacing;
  final BoxDecoration? decoration;

  Section({
    super.key,
    required this.child,
    this.title,
    this.padding = const EdgeInsets.all(12),
    this.titlePadding = EdgeInsets.zero,
    this.spacing = 0,
    this.decoration,
    EdgeInsets? margin,
    EdgeInsets? contentPadding,
  })  : margin = margin ?? defaultMargin,
        contentPadding = contentPadding ??
            EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ??
          BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
          ),
      margin: margin,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null)
            Padding(
              padding: titlePadding,
              child: Text(
                title!,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
          spacing.shb,
          Padding(padding: contentPadding, child: child),
        ],
      ),
    );
  }
}
