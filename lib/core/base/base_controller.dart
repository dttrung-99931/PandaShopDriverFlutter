import 'dart:async';

import 'package:panshop_driver/core/error/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  Future<void> showSnackbar(String message, {String title = 'Thông báo'}) async {
    await Get.snackbar(
      title,
      message,
      colorText: Colors.black,
    ).future;
  }

  Future<void> handleServiceResult<Dto, Model>({
    required Future<Either<AppError, Dto>> serviceResult,
    required Function(Model result) onSuccess,
    required Model Function(Dto dto) dtoToModel,
    Function(AppError result)? onError,
    bool handleLoading = true,
  }) async {
    isLoading = true;
    Either<AppError, Dto> result = await serviceResult;
    result.fold(
      onError ?? onErrorDefault,
      (Dto data) => onSuccess(dtoToModel(data)),
    );
    isLoading = false;
  }

  void onErrorDefault(appError) {
    showSnackbar(appError.message ?? 'Sth went wrong');
  }

  @override
  void dispose() {
    for (StreamSubscription element in _subscriptions) {
      element.cancel();
    }
    super.dispose();
  }
}
