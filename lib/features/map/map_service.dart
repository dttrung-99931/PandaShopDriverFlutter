import 'package:dartz/dartz.dart';
import 'package:panshop_driver/core/base/api_service/api_service.dart';
import 'package:panshop_driver/core/base/base_model.dart';
import 'package:panshop_driver/core/error/app_error.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/delivery_tracking_request.dart';

class DriverMapService extends ApiService {
  Future<Either<AppError, void>> createDelvieryTracking({
    required int deliveryId,
    required DeliveryTrackingRequestDto requestModel,
  }) async {
    return handleResponse(
      responseFuture: post(
        '/v1/Drivers/Delivery/$deliveryId/Tracking',
        requestModel.toJson(),
        decoder: ResponseWrapper.emptyResponse,
      ),
    );
  }
}
