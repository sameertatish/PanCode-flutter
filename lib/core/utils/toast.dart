import 'package:test_flutter/core/general_export.dart';

showToast(
        {required String msg,
        required bool isError,
        Toast? length,
        ToastGravity gravity = ToastGravity.BOTTOM}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: length ?? Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: isError ? Colors.red[300] : Colors.green[300],
      fontSize: 18.0,
    );
