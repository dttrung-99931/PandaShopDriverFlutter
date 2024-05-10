class ResponseWrapper<T> {
  final bool success;
  final int statusCode;
  final String? errorCode;
  final String? message;
  final T? data;

  ResponseWrapper({
    required this.success,
    required this.statusCode,
    this.message,
    this.errorCode,
    required this.data,
  });

  factory ResponseWrapper.fromMap(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) dataFromJson,
  ) {
    return ResponseWrapper(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      errorCode: json['errorCode'],
      data: json['data'] != null && json['data'] is Map<String, dynamic> ? dataFromJson(json['data']) : json['data'],
    );
  }
}
