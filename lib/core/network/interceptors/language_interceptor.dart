import 'package:dio/dio.dart';
import 'package:test_flutter/core/utils/shared_function.dart';

class LanguageInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = getIsEn() ? "en" : "ar";
    super.onRequest(options, handler);
  }
}
