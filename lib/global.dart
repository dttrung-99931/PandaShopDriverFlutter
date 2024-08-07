// Contains global data using in whole app
import 'package:flutter/material.dart';

class Global {
  static ValueNotifier<int> selectedMainPageIndexNotifier = ValueNotifier(0);
  static void unfocusCurrent() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
