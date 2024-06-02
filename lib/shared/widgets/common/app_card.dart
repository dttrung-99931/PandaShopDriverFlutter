import 'package:flutter/material.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';

class AppCard extends StatelessWidget {
  AppCard({
    super.key,
    required this.child,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(12),
    this.shape = BoxShape.rectangle,
    EdgeInsets? margin,
    this.borderRadius = 4,
  }) : margin = margin ?? EdgeInsets.only(top: r8, left: r8, right: r8);

  final Widget child;
  final double elevation;
  final EdgeInsets padding;
  final BoxShape shape;
  final EdgeInsets? margin;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius:
            shape != BoxShape.circle ? BorderRadius.circular(4) : null,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(-elevation, elevation),
            color: Colors.black.withOpacity(0.04),
          )
        ],
      ),
      child: child,
    );
  }
}
