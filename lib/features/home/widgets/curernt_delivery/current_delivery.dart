// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/base/base_get_widget.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/delivery_controller.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/current_delivery_model.dart';
import 'package:panshop_driver/features/home/widgets/curernt_delivery/widgets/current_delivery_actions.dart';
import 'package:panshop_driver/features/home/widgets/curernt_delivery/widgets/current_delivery_info.dart';
import 'package:panshop_driver/shared/widgets/common/section.dart';

class CurrentDelivery extends BaseGetWidget<DeliveryController> {
  const CurrentDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'current_delivery'.tr,
      padding: const EdgeInsets.fromLTRB(12, 12, 4, 12),
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      contentPadding: EdgeInsets.symmetric(vertical: r4),
      child: Obx(
        () {
          CurrentDeliveryModel? currentDelivery =
              controller.currentDelivery.value;
          if (currentDelivery == null) {
            return Text(
              'no_current_delivery'.tr,
              style: textTheme.labelLarge,
            );
          }
          return Column(
            children: [
              h2sb,
              CurrentDeliveryInfo(currentDelivery: currentDelivery),
              h2sb,
              CurrentDeliveryActions(currentDelivery: currentDelivery)
            ],
          );
        },
      ),
    );
  }
}
