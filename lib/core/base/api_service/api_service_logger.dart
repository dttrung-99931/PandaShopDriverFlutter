import 'package:get/get.dart';
import 'package:panshop_driver/core/utils/log.dart';

class ApiServiceLogger extends GetConnect {
  @override
  Future<Response<T>> post<T>(String? url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    // if (AppConfig.config.logRequest) {
    logRequest(url, body, query);
    // }
    Response<T> response = await super.post(
      url,
      body,
      contentType: contentType,
      headers: headers,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );

    logResponse(response);

    return response;
  }

  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query, Decoder<T>? decoder}) async {
    logRequest(url, '', query);

    Response<T> response = await super.get(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );

    logResponse(response);

    return response;
  }

  void logResponse(Response<dynamic> response) {
    logd('  Response');
    logd('    ${response.request?.url}');
    logd('    ${response.bodyString}', maxLength: 1000);
  }

  void logRequest(String? url, body, Map<String, dynamic>? query) {
    logd('  Request: POST');
    logd('    $url');
    logd('    Query: $query');
    logd('    Body: $body', maxLength: 1000);
    logd('');
  }
}
