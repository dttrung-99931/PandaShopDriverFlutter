import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_map/panda_map_widget.dart';
import 'package:panshop_driver/core/base/loading_obx.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/current_delivery_model.dart';
import 'package:panshop_driver/features/map/controllers/map_controller.dart';

class MapScreenArgs {
  MapScreenArgs({required this.currentDelivery});

  final CurrentDeliveryModel currentDelivery;
}

class MapScreen extends StatefulWidget {
  MapScreen({
    MapScreenArgs? args,
    super.key,
  }) : args = args ?? Get.arguments;

  static const router = '/map';

  final MapScreenArgs args;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController controller = Get.find();

  @override
  void initState() {
    controller.init(widget.args.currentDelivery);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PandaMapWidget(),
          LoadingObx(
            controller: controller,
            builder: () => const SizedBox(),
          ),
        ],
      ),
    );
  }
}
