
import 'package:flutter/material.dart';

extension NumSizeExt on num {
  SizedBox get swb => SizedBox(width: toDouble());
  SizedBox get shb => SizedBox(height: toDouble());
}
