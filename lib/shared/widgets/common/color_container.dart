import 'package:flutter/cupertino.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';

/// Widget that used to to determine how much space [child] take
/// by set a background color
class ColorContainer extends StatelessWidget {
  final Widget child;
  const ColorContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.green2,
      child: child,
    );
  }
}
