import 'package:flutter/material.dart';
import 'package:panda_map/panda_map_widget.dart';
import 'package:panshop_driver/core/base/base_get_widget.dart';
import 'package:panshop_driver/features/map/controllers/map_controller.dart';

class MapScreen extends BaseGetWidget<MapController> {
  const MapScreen({super.key});
  static const router = '/map';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PandaMapWidget(),
    );
  }
}
