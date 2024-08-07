import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/constants.dart';
import 'package:panshop_driver/core/constants/diemsions/size_extensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/utils/extension/ui_extensions.dart';
import 'package:panshop_driver/global.dart';
import 'package:panshop_driver/shared/widgets/common/loading_widget.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final Widget? icon;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color loadingColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final double elevation;
  final double titleFontSize;
  final bool isTitleBold;
  final double iconSpacing;
  final TextStyle? titleStyle;
  final bool isLoading;

  const CustomButton({
    super.key,
    this.label,
    this.child,
    this.onPressed,
    this.width,
    this.borderRadius = 6,
    this.elevation = 5,
    this.backgroundColor = AppColors.primary,
    this.loadingColor = AppColors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
    this.margin = EdgeInsets.zero,
    this.titleFontSize = 14,
    this.icon,
    this.iconSpacing = 12,
    this.titleStyle,
    this.height,
    this.isTitleBold = false,
    this.isLoading = false,
  }) : assert((label != null) != (child != null),
            'Either title or child must be not null');

  @override
  Widget build(BuildContext context) {
    TextStyle style = titleStyle ??
        textTheme.bodyMedium!.copyWith(
          color: AppColors.white,
          fontWeight: isTitleBold ? FontWeight.bold : FontWeight.normal,
          fontSize: titleFontSize,
        );
    if (isLoading) {
      style = style.copyWith(color: backgroundColor);
    }
    Widget buttonContent = child ??
        (isLoading
            ? emptyWidget
            : Text(
                label!.tr,
                style: style.withHeight(1.3),
                textAlign: TextAlign.center,
              ));
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: !isLoading && onPressed != null
            ? () {
                Global.unfocusCurrent();
                onPressed?.call();
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
          elevation: elevation,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) iconSpacing.swb,
            isLoading
                ? Expanded(
                    child: Stack(
                      // buttonContent can be emptyWidget, so stack need to expaned so that loading can showing
                      fit: StackFit.expand,
                      children: [
                        buttonContent,
                        Positioned.fill(
                          child: LoadingWidget(size: 20.r, color: loadingColor),
                        ),
                      ],
                    ),
                  )
                : buttonContent,
          ],
        ),
      ),
    );
  }
}
