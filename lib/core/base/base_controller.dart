import 'dart:async';

import 'package:panshop_driver/core/error/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/utils/snack_utils.dart';
import 'package:panshop_driver/features/auth/login/controllers/login_controller.dart';
import 'package:panshop_driver/features/auth/login/screens/login_screen.dart';
import 'package:panshop_driver/main_controller.dart';

class BaseController extends GetxController {
  final _isLoading = false.obs;
  final _subscriptions = List<StreamSubscription>.empty(growable: true);

  bool get isLoading => _isLoading.value;
  @protected
  set isLoading(bool value) => _isLoading.value = value;

  /// Generic function for listening change of a obversable variable
  /// and keep the subscription of listening to cancel when controller disposed
  void listen<T>(RxNotifier<T> notifier, Function(T) onChanged) {
    _subscriptions.add(notifier.listen(onChanged));
  }

  Future<void> handleServiceResult<Dto, Model>({
    required Future<Either<AppError, Dto>> serviceResult,
    required Function(Model result) onSuccess,
    Model Function(Dto dto)? dtoToModel,
    Function(AppError result)? onError,
    bool handleLoading = true,
  }) async {
    isLoading = true;
    Either<AppError, Dto> result = await serviceResult;
    result.fold(
      onError ?? onErrorDefault,
      (Dto data) => onSuccess(
        dtoToModel != null ? dtoToModel(data) : data as Model,
      ),
    );
    isLoading = false;
  }

  void onErrorDefault(AppError appError) {
    // Hanlde token expired error
    if (appError is ServerError && appError.statusCode == 401) {
      Get.find<MainController>().onTokenExpired();
      return;
    }

    showSnackbar(appError.message);
  }

  @override
  void dispose() {
    for (StreamSubscription element in _subscriptions) {
      element.cancel();
    }
    super.dispose();
  }
}
