import 'package:easy_localization/easy_localization.dart';

import '../../generated/locale_keys.g.dart';

class Validator {
  static final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  // static final RegExp _fullNameRegExp = RegExp(r'^[a-zA-Z \-]+$');
  static final RegExp _fullNameRegExp =
      RegExp(r'^[a-zA-Z]+(?:[- ][a-zA-Z]+)*$');

  static String? emailValidator(String? email) {
    if ((email?.isEmpty ?? false) || email == '') {
      return null;
    } else {
      if (_emailRegExp.hasMatch(email ?? '')) {
        return null;
      } else {
        return LocaleKeys.validator_email.tr();
      }
    }

    // =>
    //   _emailRegExp.hasMatch(email ?? '')
    //       ? null
    //       : LocaleKeys.validator_email.tr();
  }

  static String? emptyValidator(String? value) =>
      (value?.isNotEmpty ?? false) ? null : LocaleKeys.validator_empty.tr();

  static String? passwordValidator(
      {String? password, String? confirmPassword}) {
    confirmPassword = password;
    String passwordRegExp =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(passwordRegExp);
    if (password?.isEmpty ?? false) {
      return (LocaleKeys.validator_empty).tr();
    } else if (!regExp.hasMatch(password ?? '')) {
      return (LocaleKeys.validator_passwordValid).tr();
    }
    return null;
  }

  static String? fullNameValidator({String? fullName}) {
    if (fullName?.isEmpty ?? false) {
      return (LocaleKeys.validator_empty).tr();
    } else if (!_fullNameRegExp.hasMatch(fullName ?? '')) {
      return (LocaleKeys.validator_fullName).tr();
    }
    return null;
  }
}
