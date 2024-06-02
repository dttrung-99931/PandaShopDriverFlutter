// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/base/loading_obx.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/delivery_model.dart';
import 'package:panshop_driver/features/auth/delivery/screens/widgets/delivery_item.dart';
import 'package:panshop_driver/shared/widgets/common/not_found.dart';
import 'package:panshop_driver/shared/widgets/common/section.dart';

import '../../../../../core/base/base_get_widget.dart';
import '../../controllers/delivery_controller.dart';

class UpcomingDeliveryList extends BaseGetWidget<DeliveryController> {
  UpcomingDeliveryList({super.key});
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: RefreshIndicator(
        onRefresh: () async {
          Get.find<DeliveryController>().getUpconingDeliveries();
        },
        child: Section(
          title: 'incoming_deliveries'.tr,
          contentPadding: EdgeInsets.symmetric(vertical: r4),
          child: LoadingObx<DeliveryController>(
            // isSliver: true,
            builder: () {
              List<DeliveryModel> deliveries = controller.deliveries;
              return deliveries.isNotEmpty
                  ? SizedBox(
                      height: 0.28.sh,
                      child: Scrollbar(
                        controller: scrollController,
                        thumbVisibility: true,
                        child: ListView.separated(
                          controller: scrollController,
                          padding: EdgeInsets.zero,
                          itemCount: controller.deliveries.length,
                          itemBuilder: (context, index) {
                            return DeliveryItem(
                                delivery: controller.deliveries[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return h8sb;
                          },
                        ),
                      ),
                    )
                  : const Center(child: NotFound(isSliver: true));
            },
          ),
        ),
      ),
    );
  }
}
