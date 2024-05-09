import 'package:flutter/material.dart';
import 'package:panshop_driver/core/utils/extension/list_extension.dart';

class SpacingRow extends Row {
  SpacingRow({
    double spacing = 0,
    List<Widget> children = const [],
    super.mainAxisSize = MainAxisSize.max,
    super.mainAxisAlignment = MainAxisAlignment.start,
    super.crossAxisAlignment = CrossAxisAlignment.center,
    super.key,
  }) : super(
          children: children.addBetweenEvery(SizedBox(width: spacing)),
        );
}
