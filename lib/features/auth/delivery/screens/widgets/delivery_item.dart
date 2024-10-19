// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/utils/extension/list_extension.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/delivery_controller.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/address_model.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/delivery_model.dart';
import 'package:panshop_driver/features/auth/delivery/screens/delivery_overveiw_bottom_sheet.dart';
import 'package:panshop_driver/shared/widgets/common/app_icon_button.dart';
import 'package:panshop_driver/shared/widgets/common/icon_title.dart';
import 'package:panshop_driver/shared/widgets/layout/spacing_column.dart';

class DeliveryItem extends StatelessWidget {
  const DeliveryItem({
    super.key,
    required this.delivery,
  });
  final DeliveryModel delivery;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.toNamed(
          '${Get.currentRoute}/${DeliveryOverviewBottomSheetScreen.router}',
          arguments: DeliveryOverviewBottomSheetArgs(delivery: delivery),
        );
      },
      child: Container(
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
            Stack(
              clipBehavior: Clip.none,
              children: [
                IconTitle(
                  icon: Icons.timer_outlined,
                  title: delivery.estimtatedPickUpDuration,
                ),
                Positioned(
                  top: -h12,
                  right: 0,
                  child: AppIconButton(
                    onPressed: () {
                      Get.find<DeliveryController>().startDelivery(delivery.id);
                    },
                    iconData: Icons.play_arrow_outlined,
                  ),
                )
              ],
            ),
            SpacingColumn(
              spacing: h4,
              children: delivery.deliveryLocations.mapList(
                (AddressModel address) => IconTitle(
                  icon: Icons.location_on_outlined,
                  title: address.adddress,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
