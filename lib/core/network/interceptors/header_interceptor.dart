import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Connection'] = 'keep-alive';
    options.headers['Accept'] = 'application/json';
    // options.headers['Content-Type'] = 'multipart/form-data';
    super.onRequest(options, handler);
  }
}
