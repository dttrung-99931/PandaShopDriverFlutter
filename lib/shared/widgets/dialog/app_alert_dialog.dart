import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/utils/extension/ui_extensions.dart';
import 'package:panshop_driver/global.dart';
import 'package:panshop_driver/shared/widgets/buttons/cutstom_button.dart';
import 'package:panshop_driver/shared/widgets/layout/spacing_row.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    this.title = '',
    this.message,
    this.content,
    this.width = 300,
    this.confirmLabel = 'Xác nhận',
    this.negativeLabel,
    this.cancelLabel = 'Hủy bỏ',
    this.onConfirm,
    this.onNegativePressed,
    this.onCancelPressed,
    this.primaryColor,
    this.isDoneIcon = false,
    super.key,
  });

  final String title;
  final String? message;
  final Widget? content;
  final double width;
  final String confirmLabel;
  final String? negativeLabel;
  final String cancelLabel;
  final void Function()? onConfirm;
  final void Function()? onNegativePressed;
  final void Function()? onCancelPressed;
  final Color? primaryColor;
  final bool isDoneIcon;

  static Future<T?> show<T extends Object>({
    required BuildContext context,
    required String title,
    required void Function() onConfirm,
    void Function()? onCancel,
    bool isPositive = false,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AppAlertDialog(
        primaryColor: isPositive ? AppColors.primary : AppColors.red,
        title: title,
        onConfirm: onConfirm,
        onCancelPressed: onCancel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = primaryColor ?? (isDoneIcon ? AppColors.primary : AppColors.red);
    return Dialog(
      backgroundColor: AppColors.transparent,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: width,
            margin: EdgeInsets.only(top: 32.h),
            padding: EdgeInsets.symmetric(vertical: h12, horizontal: w16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (title.isNotEmpty) ...[
                  h8sb,
                  Text(title, style: textTheme.bodySmall),
                  h20sb,
                ],
                if (message != null) ...[
                  Row(children: [
                    Expanded(
                      child: Text(
                        message!,
                        style: textTheme.bodyLarge!.spacing(-24).light(),
                      ),
                    )
                  ]),
                  h10sb,
                ],
                if (content != null) ...[
                  content!,
                  h24sb,
                ],
                SpacingRow(
                  spacing: 12.w,
                  children: [
                    Expanded(
                      child: CustomButton(
                        elevation: 0,
                        label: cancelLabel,
                        onPressed: onCancelPressed ?? () => Get.back(),
                        backgroundColor: AppColors.grey,
                      ),
                    ),
                    if (negativeLabel != null)
                      Expanded(
                        child: CustomButton(
                          elevation: 0,
                          label: negativeLabel!,
                          onPressed: onNegativePressed,
                          backgroundColor: color,
                        ),
                      ),
                    Expanded(
                      child: CustomButton(
                        elevation: 0,
                        label: confirmLabel,
                        onPressed: () {
                          onConfirm?.call();
                          Get.back();
                        },
                        backgroundColor: color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // TODO:
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   top: 0,
          //   child: SvgPicture.asset(
          //     isDoneIcon ? Assets.ic.doneCircle : Assets.ic.warningCircle,
          //     width: 64.h,
          //     height: 64.h,
          //   ),
          // ),
        ],
      ),
    );
  }
}
