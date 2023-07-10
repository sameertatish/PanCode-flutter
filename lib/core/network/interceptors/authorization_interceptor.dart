import 'package:test_flutter/core/general_export.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await getToken();
    // options.headers['token'] = token;
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
