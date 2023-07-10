// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  String? refresh;
  String? access;

  LogInModel({
    this.refresh,
    this.access,
  });

  LogInModel copyWith({
    String? refresh,
    String? access,
  }) =>
      LogInModel(
        refresh: refresh ?? this.refresh,
        access: access ?? this.access,
      );

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}
