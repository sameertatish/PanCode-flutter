import 'package:easy_localization/easy_localization.dart';
import 'package:test_flutter/core/general_export.dart';

class DioException implements Exception {
  late String errorMessage;

  DioException.fromDioError(DioError dioError, {String message = "Error"}) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage =
            _handleStatusCode(dioError.response?.statusCode, message);
        showToast(msg: errorMessage, isError: true);
        break;
      case DioErrorType.response:
        errorMessage =
            _handleStatusCode(dioError.response?.statusCode, message);
        showToast(msg: errorMessage, isError: true);
        break;
      case DioErrorType.connectTimeout:
        errorMessage = (LocaleKeys.connectionTimedOut).tr();
        showToast(msg: errorMessage, isError: true);
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = (LocaleKeys.receivingTimeoutOccurred).tr();
        showToast(msg: errorMessage, isError: true);
        break;
      case DioErrorType.sendTimeout:
        errorMessage = (LocaleKeys.requestSendTimeout).tr();
        showToast(msg: errorMessage, isError: true);
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          errorMessage = (LocaleKeys.noInternet).tr();
          showToast(msg: errorMessage, isError: true);
          break;
        }
        errorMessage = (LocaleKeys.unexpectedErrorOccurred).tr();
        showToast(msg: errorMessage, isError: true);
        break;
      default:
        errorMessage = (LocaleKeys.somethingWentWrong).tr();
        showToast(msg: errorMessage, isError: true);
        break;
    }
  }

  String _handleStatusCode(int? statusCode, String message) {
    switch (statusCode) {
      case 400:
        return message;
      case 401:
        logoutConfirmed();
        return (LocaleKeys.authenticationFailed).tr();
      case 403:
        return (LocaleKeys
                .theAuthenticatedUserIsNotAllowedToAccessTheSpecifiedApiEndpoint)
            .tr();
      case 404:
        return (LocaleKeys.theRequestedResourceDoesNotExist).tr();
      case 405:
        return (LocaleKeys.methodNotAllowed).tr();
      case 415:
        return (LocaleKeys.UnsupportedMediaType).tr();
      case 422:
        return message;
      case 429:
        return (LocaleKeys.UnsupportedMediaType).tr();
      case 500:
        return message;
      default:
        return (LocaleKeys.somethingWentWrong).tr();
    }
  }

  @override
  String toString() => errorMessage;
}
