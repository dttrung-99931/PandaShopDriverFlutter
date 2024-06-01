import 'package:dartz/dartz.dart';
import 'package:panshop_driver/core/base/api_service/api_service.dart';
import 'package:panshop_driver/core/base/base_model.dart';
import 'package:panshop_driver/core/error/app_error.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/delivery_response.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/incoming_deliveries_request.dart';

class DeliveryService extends ApiService {
  Future<Either<AppError, List<DeliveryResponseDto>>> getIncomingDeliveries(
      GetUpcomingDeliveriesRequestDto param) async {
    return handleResponse(
      responseFuture: get(
        '/v1/Drivers/UpcomingDeliveries',
        query: param.toMap(),
        decoder: (response) => ResponseWrapper.dataList(
          responseJson: response,
          itemFromJson: DeliveryResponseDto.fromMap,
        ),
      ),
    );
  }
}
