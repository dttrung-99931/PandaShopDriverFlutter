import 'dart:io';

import 'package:panshop_driver/config/app_config.dart';
import 'package:panshop_driver/core/base/api_service/api_service_logger.dart';
import 'package:panshop_driver/core/base/api_service/error_code_messages.dart';
import 'package:panshop_driver/core/base/base_model.dart';
import 'package:panshop_driver/core/constants/constants.dart';
import 'package:panshop_driver/core/error/app_error.dart';
import 'package:panshop_driver/core/error/network_error.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/utils/log.dart';
import 'package:panshop_driver/core/utils/utils.dart';
import '../../error/exceptions/no_internet.dart';

/// Base service class for handling API calls
abstract class ApiService extends ApiServiceLogger implements GetxService {
  ApiService() {
    // TODO: get from config
    baseUrl = AppConfig.config.apiUrl;
    allowAutoSignedCert = true;
  }

  /// Http Get method
  ///
  /// throw [NoInternetException] if [requireNetwrok] = true (defualt = true)
  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    bool requireNetwrok = true,
  }) async {
    var response = await super.get(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );

    if (requireNetwrok && response.status.connectionError) {
      throw NoInternetException();
    }

    return response;
  }

  Future<Either<AppError, T>> handleResponse<T>({
    required Future<Response<ResponseWrapper<T>>> responseFuture,
    bool requireNetwrok = true,
    bool allowSuccessNullBody = false,
  }) async {
    Response<ResponseWrapper<T>>? response;

    try {
      response = await responseFuture;
    } catch (e) {
      logd(e);
      return Left(
        UnexpectedAppError(message: 'Xảy ra lỗi trong quá trình xử lý', exception: e)
          ..log(moreDetailedStackTrace: e is TypeError ? e.stackTrace : null),
      );
    }

    if (requireNetwrok && response.status.connectionError) {
      return Left(NetworkError());
    }

    if (Constants.sucessfulStatusCodes.contains(response.statusCode) &&
        (allowSuccessNullBody || response.body?.data != null)) {
      return Right(response.body?.data as T);
    }
    return Left(
      ServerError(
        message: _getErrorMessage(response),
        statusCode: response.status.code ?? -1,
      ),
    );
  }

  String _getErrorMessage(Response<ResponseWrapper<dynamic>> response) {
    String message = '';
    if (!isNullOrEmpty(response.body?.message)) {
      message = response.body!.message!;
    } else if (response.unauthorized) {
      message = 'Lỗi xác thực';
    } else if (response.status.code == HttpStatus.notFound) {
      message = 'Không tìm thấy';
    } else if (response.status.code == HttpStatus.conflict) {
      message = 'Dữ liệu không hợp lệ';
    } else if (response.status.code == HttpStatus.forbidden) {
      message = 'Không có quyền';
    }

    // Error code
    if (!isNullOrEmpty(response.body?.errorCode)) {
      String? errorMsg = errorCodeMsgMap[response.body?.errorCode];
      if (message.isNotEmpty) {
        message += '\n';
      }
      message += (errorMsg ?? '');

      if (message.isNotEmpty) {
        message += '\n';
      }
      message += 'Error code: ${response.body!.errorCode!}';
    }

    return message;
  }
}
