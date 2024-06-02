// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/base/base_controller.dart';

import '../../shared/widgets/common/loading_widget.dart';

/// Handles widget loading
///
/// return LoadingWidget if [controller] isLoading.
/// Otherwise, return [builder]
class LoadingObx<T extends BaseController> extends Obx {
  LoadingObx({
    required Widget Function() builder,
    super.key,
    this.isSliver = false,
    T? controller,
  })  : controller = controller ?? Get.find(),
        super(builder);

  final bool isSliver;
  final T controller;

  @override
  Widget build() {
    return controller.isLoading
        ? isSliver
            ? const SliverFillRemaining(child: LoadingWidget())
            : const LoadingWidget()
        : builder();
  }
}
