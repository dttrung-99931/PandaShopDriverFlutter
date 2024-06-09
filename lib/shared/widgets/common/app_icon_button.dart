// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';

class AppIconButton extends StatelessWidget {
  AppIconButton({
    super.key,
    this.icon,
    this.iconData,
    required this.onPressed,
  }) {
    assert(iconData == null || icon == null,
        'Cannot used iconData when used icon');
  }

  final IconData? iconData;
  final Widget? icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(r8),
      minSize: 0,
      onPressed: onPressed,
      child: icon ??
          Icon(
            iconData!,
            color: AppColors.primary,
          ),
    );
  }
}
