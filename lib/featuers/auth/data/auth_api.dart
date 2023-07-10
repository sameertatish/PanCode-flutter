import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/auth/data/model/log_in_body_model.dart';
import 'package:test_flutter/featuers/auth/data/model/log_in_model.dart';

class DioAuth {
  DioAuth()
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

  Future<LogInModel> checkLogIn(LogInBodyModel logInBodyModel) async {
    try {
      var res = await _dio.post('api/token/', data: logInBodyModel);
      return logInModelFromJson(res.toString());
    } on DioError catch (err) {
      String msg = "";
      msg = err.response?.data['detail'] ?? "";
      String errorMessage =
          DioException.fromDioError(err, message: msg).toString();
      throw errorMessage;
    }
  }
}
