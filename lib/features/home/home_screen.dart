import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/config/assets/assets.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/utils/extension/ui_extensions.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/delivery_controller.dart';
import 'package:panshop_driver/features/auth/delivery/screens/widgets/upcoming_delivery_list.dart';
import 'package:panshop_driver/features/home/widgets/curernt_delivery/current_delivery.dart';
import 'package:panshop_driver/shared/widgets/common/app_card.dart';
import 'package:panshop_driver/shared/widgets/common/app_icon_button.dart';

import '../../core/base/base_get_widget.dart';
import 'home_controller.dart';

class HomeScreen extends BaseGetWidget<HomeController> {
  static const route = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<DeliveryController>().getUpconingDeliveries();
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AppCard(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: Row(
                    children: [
                      images.logo.build(height: h48),
                      w8sb,
                      Text(
                        'Driver 99931',
                        style: textTheme.bodyLarge.bold(),
                      ),
                      const Spacer(),
                      AppIconButton(iconData: Icons.menu, onPressed: () {})
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: CurrentDelivery()),
              UpcomingDeliveryList(),
            ],
          ),
        ),
      ),
    );
  }
}
