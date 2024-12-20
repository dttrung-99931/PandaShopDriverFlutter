// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/current_delivery_model.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/delivery_progress_model.dart';
import 'package:panshop_driver/features/map/map_screen.dart';
import 'package:panshop_driver/shared/widgets/common/app_icon_button.dart';

class CurrentDeliveryActions extends StatelessWidget {
  const CurrentDeliveryActions({
    super.key,
    required this.currentDelivery,
  });

  final CurrentDeliveryModel currentDelivery;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        w2sb,
        Expanded(
          child: DeliveryDistanceProgeress(progress: currentDelivery.progress),
        ),
        w8sb,
        Transform.translate(
          offset: Offset(0, h10),
          child: AppIconButton(
            icon: const Icon(
              Icons.check,
              color: AppColors.green2,
              size: 28,
            ),
            onPressed: () {},
          ),
        ),
        Transform.translate(
          offset: Offset(0, h8),
          child: AppIconButton(
            icon: const Icon(
              Icons.location_on,
              color: AppColors.primary,
              size: 22,
            ),
            onPressed: () {
              Get.toNamed(
                MapScreen.router,
                arguments: MapScreenArgs(currentDelivery: currentDelivery),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DeliveryDistanceProgeress extends StatelessWidget {
  const DeliveryDistanceProgeress({
    super.key,
    required this.progress,
  });
  final DeliveryProgressModel progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(progress.currentDistanceInfo, style: textTheme.labelMedium),
        h4sb,
        LinearProgressIndicator(
          color: AppColors.primary,
          minHeight: 6,
          value: progress.routeCompletePercents,
          borderRadius: BorderRadius.circular(2),
        ),
      ],
    );
  }
}
