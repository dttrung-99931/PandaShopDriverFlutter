import 'package:flutter/material.dart';
import 'package:panshop_driver/core/utils/extension/list_extension.dart';

class SpacingColumn extends Column {
  SpacingColumn({
    double spacing = 0,
    List<Widget> children = const [],
    super.mainAxisSize = MainAxisSize.max,
    super.mainAxisAlignment = MainAxisAlignment.start,
    super.crossAxisAlignment = CrossAxisAlignment.start,
    super.key,
  }) : super(
          children: children.addBetweenEvery(SizedBox(height: spacing)),
        );
}
