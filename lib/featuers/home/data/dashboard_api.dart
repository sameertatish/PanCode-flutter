import 'package:test_flutter/core/general_export.dart';

import 'model/marketer_model.dart';

class DioDashboard {
  DioDashboard()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: Endpoints.connectionTimeout,
            receiveTimeout: Endpoints.receiveTimeout,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            LoggerInterceptor(),
            LanguageInterceptor(),
            HeaderInterceptor(),
            AuthorizationInterceptor()
          ]);

  late final Dio _dio;

  Future<MarketerModel> dashbaordDetails() async {
    try {
      var res = await _dio.get('api/marketer/get_all');
      return marketerModelFromJson(res.toString());
    } on DioError catch (err) {
      String msg = "";
      msg = err.response?.data['message'] ?? "";
      String errorMessage =
          DioException.fromDioError(err, message: msg).toString();
      throw errorMessage;
    }
  }
}
