// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_widget.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/utils/format_utils.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/current_delivery_model.dart';
import 'package:panshop_driver/features/map/controllers/map_controller.dart';
import 'package:panshop_driver/shared/widgets/common/icon_title.dart';
import 'package:panshop_driver/shared/widgets/common/loading_widget.dart';

class DeliveryOverviewBottomSheetArgs {
  final CurrentDeliveryModel currentDelivery;
  DeliveryOverviewBottomSheetArgs({
    required this.currentDelivery,
  });
}

class DeliveryOverviewBottomSheetScreen extends StatefulWidget {
  const DeliveryOverviewBottomSheetScreen({
    super.key,
    required this.args,
  });
  final DeliveryOverviewBottomSheetArgs args;
  static const router = '/deliveryOverview';

  @override
  State<DeliveryOverviewBottomSheetScreen> createState() =>
      _DeliveryOverviewBottomSheetScreenState();
}

class _DeliveryOverviewBottomSheetScreenState
    extends State<DeliveryOverviewBottomSheetScreen>
    with TickerProviderStateMixin {
  final MapController _controller = Get.find();
  late final AnimationController _animController;

  @override
  void initState() {
    _controller.init(widget.args.currentDelivery);
    _animController = BottomSheet.createAnimationController(
      this,
      sheetAnimationStyle: AnimationStyle(
        duration: 600.milliseconds,
        reverseDuration: 600.milliseconds,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeIn,
      ),
    );
    _animController.addStatusListener(_animStatusListener);
    super.initState();
  }

  void _animStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.reverse) {
      Get.back();
    }
  }

  @override
  void dispose() {
    _animController.removeStatusListener(_animStatusListener);
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.shadow,
      child: TapRegion(
        onTapOutside: (event) {
          _onClose();
        },
        child: BottomSheet(
          animationController: _animController,
          elevation: 4,
          shadowColor: AppColors.shadow,
          backgroundColor: AppColors.white,
          // constraints: BoxConstraints(
          //   maxHeight: 0.612.sh,
          // ),
          showDragHandle: true,
          onClosing: _onClose,
          builder: (context) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Container(
                // height: 0.8.sh,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: PandaMapWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: AnimatedBuilder(
                        animation: PandaMap.routingController,
                        builder: (_, __) {
                          MapRoute? route =
                              PandaMap.routingController.previewRoute;
                          if (route != null) {
                            return Row(
                              children: [
                                Flexible(
                                  child: IconTitle(
                                    icon: Icons.space_bar_outlined,
                                    title: route.lengthInKm,
                                    labelFontSize: 14,
                                    iconSize: 20,
                                  ),
                                ),
                                Flexible(
                                  child: IconTitle(
                                    icon: Icons.alarm_on_outlined,
                                    title:
                                        formatHourMin(route.durationInMinutes),
                                    labelFontSize: 14,
                                    iconSize: 20,
                                  ),
                                ),
                                Flexible(
                                  child: IconTitle(
                                    icon: Icons.badge_outlined,
                                    title: '${3} packages',
                                    labelFontSize: 14,
                                    iconSize: 20,
                                  ),
                                ),
                              ],
                            );
                          }
                          return const LoadingWidget();
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onClose() {
    Get.back();
  }
}
