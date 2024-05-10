import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/shared/widgets/icon_button.dart';
import 'package:panshop_driver/shared/widgets/title_icon_button.dart';

import '../../core/base/base_get_widget.dart';
import 'home_controller.dart';

class HomeScreen extends BaseGetWidget<HomeController> {
  static const route = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIconButton(
              iconData: Icons.local_shipping_outlined,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
