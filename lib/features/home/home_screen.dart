import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/delivery_controller.dart';
import 'package:panshop_driver/features/auth/delivery/screens/widgets/upcoming_delivery_list.dart';
import 'package:panshop_driver/shared/widgets/common/sliver_section.dart';

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
              SliverSection(
                title: 'current_delivery'.tr,
                child: const Text(''),
              ),
              const UpcomingDeliveryList(),
            ],
          ),
        ),
      ),
    );
  }
}
