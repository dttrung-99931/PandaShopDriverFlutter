import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:panshop_driver/shared/widgets/common/section.dart';

class SliverSection extends StatelessWidget {
  final Widget child;
  final String title;
  final EdgeInsets padding;
  final EdgeInsets titlePadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? margin;

  const SliverSection({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.titlePadding = EdgeInsets.zero,
    this.margin,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Section(
        title: title,
        padding: padding,
        titlePadding: titlePadding,
        contentPadding: contentPadding,
        margin: margin,
        child: child,
      ),
    );
  }
}
