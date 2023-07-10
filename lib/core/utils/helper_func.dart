import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';

Map<String, dynamic> objectToMap(String str) {
  return json.decode(str);
}

String? dateTimeByMonth(String? date) {
  try {
    DateTime dateTime = DateTime.parse(date ?? '');
    return (DateFormat('d MMM yyyy').format(dateTime)).toString();
  } catch (ex) {
    return date?.split(' ')[0] ?? "";
  }
}

String? getCoursedateTimeByMonth(String? date) {
  try {
    DateTime dateTime = DateTime.parse(date ?? '');
    return (DateFormat('dd/MMM').format(dateTime)).toString();
  } catch (ex) {
    return date?.split(' ')[0] ?? "";
  }
}

String? getCourseDayDate(String? startDate) {
  DateTime date = DateTime.parse(startDate ?? '');
  return '${(date).day} ';
}

String? getMonthYearDate(String? startDate) {
  DateTime date = DateTime.parse(startDate ?? '');
  String monthName = DateFormat('MMMM').format(date);
  return monthName;
}

String? getYear(String? startDate) {
  DateTime date = DateTime.parse(startDate ?? '');
  return '${(date).year} ';
}

String? lengthfSession(String? start, String? end) {
  try {
    var format = DateFormat("HH:mm"); // or if '12:00

    DateTime startTime = format.parse(start ?? '');
    DateTime endTime = format.parse(end ?? '');

    var d = endTime.difference(startTime);
    return '${d.inMinutes.toString()}min';
  } catch (ex) {
    return "";
  }
}

String? lengthContentSession(String? start, String? end) {
  try {
    var format = DateFormat("HH:mm"); // or if '12:00

    DateTime startTime = format.parse(start ?? '');
    DateTime endTime = format.parse(end ?? '');

    var d = endTime.difference(startTime);
    return '${d.inMinutes.toString()}:${d.inSeconds.toString()}';
  } catch (ex) {
    return "";
  }
}

String? getFirstCharformNameAndFirsCharFromTitle(String? fullName) {
  try {
    if ((fullName?.isNotEmpty ?? false) &&
        (fullName != '') &&
        (fullName != null)) {
      String name = "$fullName ";
      if ((name.contains('-'))) {
        name = name.replaceAll(('-'), ' ');
      }
      if ((name.contains('_'))) {
        name = name.replaceAll(('_'), ' ');
      }
      if ((name.contains('.'))) {
        name = name.replaceAll(('.'), ' ');
      }
      List<String>? res = name.split(' ');
      return (('${res[0][0]}${res[1][0]}').toUpperCase());
    } else {
      return '';
    }
  } catch (e) {
    return fullName?[0].toUpperCase();
  }
}
