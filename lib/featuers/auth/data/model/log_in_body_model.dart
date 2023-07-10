// To parse this JSON data, do
//
//     final logInBodyModel = logInBodyModelFromJson(jsonString);

import 'dart:convert';

LogInBodyModel logInBodyModelFromJson(String str) =>
    LogInBodyModel.fromJson(json.decode(str));

String logInBodyModelToJson(LogInBodyModel data) => json.encode(data.toJson());

class LogInBodyModel {
  String? username;
  String? password;

  LogInBodyModel({
    this.username,
    this.password,
  });

  LogInBodyModel copyWith({
    String? username,
    String? password,
  }) =>
      LogInBodyModel(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  factory LogInBodyModel.fromJson(Map<String, dynamic> json) => LogInBodyModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
