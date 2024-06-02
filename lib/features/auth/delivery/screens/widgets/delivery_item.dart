// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/delivery_model.dart';
import 'package:panshop_driver/shared/widgets/common/icon_title.dart';

class DeliveryItem extends StatelessWidget {
  const DeliveryItem({
    super.key,
    required this.delivery,
  });
  final DeliveryModel delivery;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      padding: EdgeInsets.symmetric(
        vertical: r8,
        horizontal: r8,
      ),
      child: Column(
        children: [
          IconTitle(
            icon: Icons.timer_outlined,
            title: delivery.estimtatedPickUpDuration,
          ),
          h4sb,
          IconTitle(
            icon: Icons.location_on_outlined,
            title: delivery.address.adddress,
          ),
        ],
      ),
    );
  }
}
