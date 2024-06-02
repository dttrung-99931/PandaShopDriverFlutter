import 'package:get/get.dart';
import 'package:panshop_driver/core/utils/extension/list_extension.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/delivery_model.dart';
import 'package:panshop_driver/features/auth/delivery/services/delivery_service.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/incoming_deliveries_request.dart';

import '../../../../core/base/base_controller.dart';

class DeliveryController extends BaseController {
  final DeliveryService _service = Get.find();
  final RxList<DeliveryModel> deliveries = RxList<DeliveryModel>();
  final Rx<DeliveryModel?> currentDelivery = Rx(null);

  @override
  void onInit() {
    super.onInit();
    getUpconingDeliveries();
  }

  Future<void> getUpconingDeliveries() async {
    await handleServiceResult(
      serviceResult:
          _service.getIncomingDeliveries(GetUpcomingDeliveriesRequestDto()),
      dtoToModel: (dtos) => dtos.mapList((dto) => DeliveryModel.fromDto(dto)),
      onSuccess: (List<DeliveryModel> result) {
        // TODO: fix confused btw multiple list.assignAll extensions
        // deliveries.assignAll(result);
        deliveries.value = result;

        // Set mock current delivery. TODO: remove when compelte
        if (result.isNotEmpty) {
          currentDelivery.value = result.first;
        }
      },
    );
  }
}
