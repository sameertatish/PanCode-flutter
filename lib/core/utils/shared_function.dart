import 'package:easy_localization/easy_localization.dart';
import 'package:test_flutter/core/general_export.dart';

logoutConfirmed() async {
  sharedFunction.removeShared(PrefKeys.tokenLoggedIn);

  showToast(msg: 'log out', isError: false);
  return AutoRouter.of(appRouter.navigatorKey.currentContext!).pushAndPopUntil(
    const HomeRoute(),
    predicate: (route) => false,
  );
}

Future<String> getToken() async {
  return await sharedFunction.getShared(PrefKeys.tokenLoggedIn) ?? "";
}

getIsEn() {
  return (LocaleKeys.langNow).tr() == "en";
}

class SharedFunction {
  getShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  getSharedBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  setShared(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  setBoolShared(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  setSharedPermission(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  removeShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
