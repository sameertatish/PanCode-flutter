import 'package:easy_localization/easy_localization.dart';
import 'package:test_flutter/core/general_export.dart';

const double radius = 10;
const int pageSize = 10;
const int pageNumberPrimery = 1;

const String baseUrl = "https://sameertatish.pythonanywhere.com/";

class PrefKeys {
  static const tokenLoggedIn = 'tokenLoggedIn';
}

class LangConst {
  static String localeEN = "US";
  static String localen = "en";
  static String localeAR = "AR";
  static String localear = "ar";
}

//#endregion user type helper

//#region gender helper

class Gender {
  final String genderName;
  final String genderValue;

  Gender({
    required this.genderName,
    required this.genderValue,
  });
}

List<Gender> bindGenderList() {
  List<Gender> genderList = [];
  genderList.add(Gender(
    genderName: (LocaleKeys.genderMale).tr(),
    genderValue: "male",
  ));
  genderList.add(Gender(
    genderName: (LocaleKeys.genderFemale).tr(),
    genderValue: "female",
  ));

  return genderList;
}

//#endregion user type helper
