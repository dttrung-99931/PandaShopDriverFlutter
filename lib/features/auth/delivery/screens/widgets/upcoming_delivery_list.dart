import 'package:flutter/material.dart';
import 'package:panshop_driver/core/base/loading_obx.dart';
import 'package:panshop_driver/core/utils/extension/list_extension.dart';
import 'package:panshop_driver/shared/widgets/common/not_found.dart';

import '../../../../../core/base/base_get_widget.dart';
import '../../controllers/delivery_controller.dart';

class UpcomingDeliveryList extends BaseGetWidget<DeliveryController> {
  const UpcomingDeliveryList({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingObx<DeliveryController>(
      isSliver: true,
      builder: () => controller.deliveries.isNotEmpty
          ? SliverList.list(
              children: controller.deliveries.mapList(
                (delivery) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      const Text('Địa chỉ'),
                      Text(delivery.address.adddress),
                    ],
                  ),
                ),
              ),
            )
          : const NotFound(isSliver: true),
    );
  }
}
