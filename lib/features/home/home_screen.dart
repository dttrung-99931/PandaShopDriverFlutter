import 'package:flutter/material.dart';
import 'package:panshop_driver/features/map/map_screen.dart';

import '../../core/base/base_get_widget.dart';
import 'home_controller.dart';

class HomeScreen extends BaseGetWidget<HomeController> {
  static const route = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Positioned.fill(child: MapScreen()),
        ],
      ),
    );
  }
}
