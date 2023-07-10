// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar_AR = {
  "langNow": "ar",
  "connectionTimedOut": "انتهت مدة الاتصال",
  "receivingTimeoutOccurred": "انتهت مدة الاستلام",
  "requestSendTimeout": "انتهت مدة الطلب",
  "noInternet": "الاتصال بالانترنت غير متوفر",
  "unexpectedErrorOccurred": "حدث خطأ غير متوقع",
  "somethingWentWrong": "حدث خطأ ما",
  "authenticationFailed": "فشلت المصادقة",
  "theAuthenticatedUserIsNotAllowedToAccessTheSpecifiedApiEndpoint": "لا يُسمح للمستخدم المصادق عليه بالوصول إلى هذه النقطة",
  "theRequestedResourceDoesNotExist": "هذا الطلب غير موجود",
  "methodNotAllowed": "الطريقة غير مسموحة. يرجى التحقق من عنوان السماح للطرق المسموح بها.",
  "UnsupportedMediaType": "نوع وسائط غير مدعوم. نوع المحتوى المطلوب أو رقم الإصدار غير صالح",
  "tooManyRequests": "عدد كثير من الطلبات",
  "gender": "الجنس",
  "genderMale": "ذكر",
  "genderFemale": "أنثى",
  "validator": {
    "email": "الرجاء ادخال بريد الكتروني صحيح",
    "phone": "رقم الهاتف مطلوب",
    "empty": "هذا الحقل مطلوب",
    "passwordValid": "يجب ان تحتوي على 8 محارف على الأٌقل أحرف صغيرة وكبيرة ورمز ورقم",
    "confirm_password": "كلمة السر غير متطابقة",
    "shouldBeNumber": "الرجاء ادخال رقم صحيح",
    "fullName": "هذا الحقل يجب ان يحتوي على أحرف يمكن ان يحتوي على احدى الرموز الخاصة مثل: ( ' _ - )"
  }
};
static const Map<String,dynamic> en_US = {
  "langNow": "en",
  "connectionTimedOut": "Connection timed out",
  "receivingTimeoutOccurred": "Receiving timeout occurred",
  "requestSendTimeout": "Request send timeout",
  "noInternet": "No Internet",
  "unexpectedErrorOccurred": "Unexpected error occurred.",
  "somethingWentWrong": "Something went wrong",
  "authenticationFailed": "Authentication failed",
  "theAuthenticatedUserIsNotAllowedToAccessTheSpecifiedApiEndpoint": "The authenticated user is not allowed to access the specified API endpoint.",
  "theRequestedResourceDoesNotExist": "The requested resource does not exist",
  "methodNotAllowed": "Method not allowed. Please check the Allow header for the allowed HTTP methods",
  "UnsupportedMediaType": "Unsupported media type. The requested content type or version number is invalid",
  "tooManyRequests": "Too many requests",
  "areYousureWantTODiscardtheChanges": "Are you sure you want to discard the changes ?",
  "gender": "Gender",
  "genderMale": "Male",
  "genderFemale": "Female",
  "validator": {
    "email": "please enter valid email",
    "phone": "phone is required",
    "empty": "filed is required",
    "confirm_password": "password doesn't match",
    "shouldBeNumber": "please enter a number",
    "passwordValid": "It must contain at least 8 characters, uppercase and lowercase letters, a symbol and a number",
    "fullName": "This field must contain letters It can contain one of the special characters such as: ( ' _ - )"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar_AR": ar_AR, "en_US": en_US};
}
