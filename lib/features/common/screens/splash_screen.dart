import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/config/assets/assets.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/utils/utils.dart';
import 'package:panshop_driver/main_controller.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    doOnBuildUICompleted(() {
      Get.find<MainController>().handleAuthNavigation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.r), child: images.logo.build(height: 128.r, width: 128.r)),
              h20sb,
              Text(
                'Panshop Driver',
                style: textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
