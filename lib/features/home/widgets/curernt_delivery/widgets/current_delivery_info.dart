// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/utils/extension/list_extension.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/address_model.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/delivery_model.dart';
import 'package:panshop_driver/shared/widgets/common/icon_title.dart';
import 'package:panshop_driver/shared/widgets/layout/spacing_column.dart';

class CurrentDeliveryInfo extends StatelessWidget {
  const CurrentDeliveryInfo({
    super.key,
    required this.currentDelivery,
  });

  final DeliveryModel currentDelivery;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      padding: EdgeInsets.symmetric(
        vertical: r4,
        horizontal: r8,
      ),
      child: Column(
        children: [
          IconTitle(
            icon: Icons.timer_outlined,
            title:
                '${currentDelivery.estimtatedPickUpDuration} (${'remaining'.tr})',
            labelFontSize: 14,
            iconSize: 24,
          ),
          h4sb,
          SpacingColumn(
            spacing: h4,
            children: currentDelivery.deliveryLocations.mapList(
              (AddressModel address) => IconTitle(
                icon: Icons.location_on_outlined,
                title: address.adddress,
                labelFontSize: 14,
                iconSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
