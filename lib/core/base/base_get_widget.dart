import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseGetWidget<TController extends BaseController>
    extends GetWidget<TController> {
  const BaseGetWidget({super.key});
}
